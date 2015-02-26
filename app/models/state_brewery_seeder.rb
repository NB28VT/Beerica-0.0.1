require 'json'

class StateBrewerySeeder
  def initialize
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = ENV['BREWERY_DB_API_TOKEN']
    end
    @states = State.all
  end

  def get_state_breweries(state)
    @brewery_db.locations.all(region: state )
  end

  # For each state, load and create the breweries and cities for that state
  def seed_breweries
   @states.each do |state|
    #  Loads brewery data from API
     state_brewery_hash = get_state_breweries(state.name)
     state_brewery_hash.each do |brewery|
       city_name = brewery[:locality]
      #  In case city is null
       if city_name
         city_loader = CityLoader.new
         brewery_city = city_loader.load_city(state, city_name)
         city_id = brewery_city.id
       else
         city_id = nil
       end

       name = brewery[:brewery][:name]
       state_id = state.id

       street_address = brewery[:street_address]
       website = brewery[:website]
       phone = brewery[:phone]
       hours_of_operation = brewery[:hours_of_operation]
       latitude = brewery[:latitude]
       longitude = brewery[:longitude]

      # IN THE FUTURE: FIND OR INITIALIZE?
       Brewery.create(
        name: name,
        state_id: state_id,
        city_id: city_id,
        street_address: street_address,
        website: website,
        phone: phone,
        hours_of_operation: hours_of_operation,
        latitude: latitude,
        longitude: longitude
        )
      end
    end
  end
end

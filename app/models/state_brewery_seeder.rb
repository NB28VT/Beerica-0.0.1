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

  def seed_breweries
   @states.each do |state|
    #  Loads brewery data from API
     state_brewery_hash = get_state_breweries(state.name)
     state_brewery_hash.each do |brewery|
       name = brewery[:brewery][:name]
       state_id = state.id
       city = brewery[:locality]
       street_address = brewery[:street_address]
       website = brewery[:website]
       phone = brewery[:phone]
       hours_of_operation = brewery[:hours_of_operation]
    

      # IN THE FUTURE: FIND OR INITIALIZE?
       Brewery.create(
        name: name,
        state_id: state_id,
        city: city,
        street_address: street_address,
        website: website,
        phone: phone,
        hours_of_operation: hours_of_operation
        )
      end
    end
  end
end

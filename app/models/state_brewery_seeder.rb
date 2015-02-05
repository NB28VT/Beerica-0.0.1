require 'json'

class StateBrewerySeeder
  def initialize
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = ENV['BREWERY_DB_API_TOKEN']
    end
    @states = State.all

    # @states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware","District of Columbia" "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska" , "Nevada", "New Hampshire", "New Jersey","New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    # # WORK ON STATE LOADER, INTEGRATING
  end

  def get_state_breweries(state)
    @brewery_db.locations.all(region: state )
  end

  # NEED TO FIGURE OUT HOW TO LOAD IN STATE OBJECTS HERE
  def seed_breweries
   @states.each do |state|
     state_brewery_hash = get_state_breweries(state.name)
     state_brewery_hash.each do |brewery|
       # Breweries methods, for each. WHAT IF MISSING?
       name = brewery[:brewery][:name]
       state_id = state.id
       city = brewery[:locality]
       street_address = brewery[:street_address]
       website = brewery[:website]
       phone = brewery[:phone]
       hours_of_operation = brewery[:hours_of_operation]

      # FIND OR INITIALIZE?
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

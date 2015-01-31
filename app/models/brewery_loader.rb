class BreweryLoader


@states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Mississippi", "Missouri", "Montana", "Nebraska" , "Nevada", "New Hampshire", "New Jersey","New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]





Dotenv.load

def initialize
  @brewery_db = BreweryDB::Client.new do |config|
    config.api_key = ENV['BREWERY_DB_API_TOKEN']
  end
end

def num_breweries(state)
  @brewery_db.locations.all(region: state ).count
end


def build_state_hash(states)
  hash = {}
  states.each do |state|
    hash[state] = num_breweries(state)
  end
end








end

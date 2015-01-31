class BreweryLoader


Dotenv.load

def initialize
  @brewery_db = BreweryDB::Client.new do |config|
    config.api_key = ENV['BREWERY_DB_API_TOKEN']
  end

  @states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Mississippi", "Missouri", "Montana", "Nebraska" , "Nevada", "New Hampshire", "New Jersey","New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]


state_brewery_hash = {"Alabama"=>26,
 "Alaska"=>30,
 "Arizona"=>77,
 "Arkansas"=>13,
 "California"=>629,
 "Colorado"=>306,
 "Connecticut"=>44,
 "Delaware"=>13,
 "Florida"=>138,
 "Georgia"=>50,
 "Hawaii"=>17,
 "Idaho"=>40,
 "Illinois"=>156,
 "Indiana"=>118,
 "Iowa"=>53,
 "Kansas"=>22,
 "Kentucky"=>31,
 "Louisiana"=>25,
 "Maine"=>64,
 "Maryland"=>66,
 "Massachusetts"=>94,
 "Michigan"=>208,
 "Mississippi"=>9,
 "Missouri"=>67,
 "Montana"=>48,
 "Nebraska"=>37,
 "Nevada"=>40,
 "New Hampshire"=>50,
 "New Jersey"=>55,
 "New Mexico"=>49,
 "New York"=>212,
 "North Carolina"=>212,
 "North Dakota"=>7,
 "Ohio"=>124,
 "Oklahoma"=>28,
 "Oregon"=>213,
 "Pennsylvania"=>186,
 "Rhode Island"=>12,
 "South Carolina"=>31,
 "South Dakota"=>12,
 "Tennessee"=>44,
 "Texas"=>202,
 "Utah"=>23,
 "Vermont"=>48,
 "Virginia"=>140,
 "Washington"=>243,
 "West Virginia"=>12,
 "Wisconsin"=>163,
 "Wyoming"=>31}
end

def num_breweries(state)
  @brewery_db.locations.all(region: state ).count
end


def build_state_hash
  hash = {}
  @states.each do |state|
    hash[state] = num_breweries(state)
  end
  hash
end








end

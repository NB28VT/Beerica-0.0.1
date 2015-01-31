class BreweryLoader

Dotenv.load

brewery_db = BreweryDB::Client.new do |config|
  config.api_key = ENV['BREWERY_DB_API_TOKEN']
end

san_fran = brewery_db.locations.all(locality: 'San Francisco')

binding.pry






end

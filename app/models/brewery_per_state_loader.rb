require 'json'
require 'csv'

class BreweryPerStateLoader
  attr_reader :brewery_db

  Dotenv.load

  def initialize
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = ENV['BREWERY_DB_API_TOKEN']
    end

    @per_capita_hash = breweries_per_capita
  end

  def breweries_per_capita
    # Initialize brewery per capita hash
    per_capita_hash = {}
    # Reads from CSV
    brewery_data = CSV.foreach('state_population_data.csv', headers: true) do |row|
      state = row[4]
      population = row[5].to_i
      # Calculates breweries per capita
      breweries_in_state = @brewery_db.locations.all(region: state ).count
      breweries_per_capita = (breweries_in_state.to_f)/(population/100000).to_f
      per_capita_hash[state] = breweries_per_capita.round(3)
    end
    per_capita_hash
  end

  # Helper method for loading breweries for each state. Called in state loader
  # CAREFUL: THIS HITS API ONCE FORE EACH STATE. 400 REQUEST LIMIT
  def load_breweries_per_capita(state)
    @per_capita_hash[state]
  end








end

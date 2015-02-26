# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Load state data
state_loader = StateLoader.new
state_loader.load_states

# Load brewery and city data
brewery_seeder = StateBrewerySeeder.new
brewery_seeder.seed_breweries

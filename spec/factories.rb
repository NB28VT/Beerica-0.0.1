require 'factory_girl'

FactoryGirl.define do

  factory :user do
    sequence(:username) {|n| "baconpancakes#{n}"}
    sequence(:email) {|n| "baconpancakes#{n}@example.com"}
    password "makinbaconpancakes"
    password_confirmation "makinbaconpancakes"
  end

  factory :state do
    sequence(:name) { | n | "State of #{n}" }
    breweries_per_capita 8
  end

  factory :city do
    name "Beerlington"
    sequence(:state_id) { |n| n }
  end

  factory :brewery do
    name "Rock Art Brewery"
    sequence(:state_id) { |n| n }
    sequence(:city_id) { |n| n }
    street_address "632 Laporte Rd"
    website "http://www.rockartbrewery.com/"
    phone "123-4567"
    hours_of_operation "Monday all day"
  end
end

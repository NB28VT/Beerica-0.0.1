require 'factory_girl'

FactoryGirl.define do
  factory :state do
    sequence(:name) {|n| "State of #{n}" }
  end

  factory :brewery do
    name "Rock Art Brewery"
    sequence(:state_id) { |n| n }
    city "Morrisville"
    street_address "632 Laporte Rd"
    website "http://www.rockartbrewery.com/"
    phone "123-4567"
    hours_of_operation "Monday all day"
  end
end

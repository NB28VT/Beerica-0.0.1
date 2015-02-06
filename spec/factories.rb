require 'factory_girl'

FactoryGirl.define do
  factory :state do
    sequence(:name) {|n| "State of #{n}" }
  end
end

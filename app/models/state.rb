class State < ActiveRecord::Base
  has_many :breweries
  has_many :cities
end

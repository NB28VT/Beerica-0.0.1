class City < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :state
  has_many :breweries
end

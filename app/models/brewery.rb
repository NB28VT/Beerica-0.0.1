class Brewery < ActiveRecord::Base
  belongs_to :state
  belongs_to :city
end

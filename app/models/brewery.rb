class Brewery < ActiveRecord::Base
  # searchkick

  belongs_to :state
  belongs_to :city
end

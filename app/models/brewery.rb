class Brewery < ActiveRecord::Base
  def self.search(search)
    where("name ILIKE?", "%#{search}")
  end

  belongs_to :state
  belongs_to :city
end

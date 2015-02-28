class ChangeCityToCityidInBrewery < ActiveRecord::Migration
  def up
    remove_column :breweries, :city
    add_column :breweries, :city_id, :integer
  end

  def down
    add_column :breweries, :city, :string
    remove_column :breweries, :city_id
  end
end

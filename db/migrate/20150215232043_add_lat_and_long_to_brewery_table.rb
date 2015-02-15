class AddLatAndLongToBreweryTable < ActiveRecord::Migration
  def up
    add_column :breweries, :latitude, :float
    add_column :breweries, :longitude, :float
  end

  def down
    remove_column :breweries, :latitude, :float
    remove_column :breweries, :longitude, :float
  end

end

class CreateCities < ActiveRecord::Migration
  def up
    add_column :cities, :state_id, :integer
  end

  def down
    remove_column :cities, :state_id
  end
end

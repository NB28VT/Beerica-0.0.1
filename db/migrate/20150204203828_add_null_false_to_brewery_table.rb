class AddNullFalseToBreweryTable < ActiveRecord::Migration
  def up
    change_column :brewery_table, :state_id, :integer, null: false
    change_column :brewery_table, :city, :string, null: false

  end

  def down
    change_column :brewery_table, :state_id, :integer, null: true
    change_column :brewery_table, :city, :string, null: true
  end
end

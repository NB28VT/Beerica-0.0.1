class CreateBreweryTable < ActiveRecord::Migration
  def change
    create_table :brewery_table do |t|
      t.string :name, null: false
      t.integer :state_id
      t.string :city
      t.string :street_address
      t.string :website
      t.string :phone
      t.string :hours_of_operation

      t.timestamps null: false
    end
  end
end

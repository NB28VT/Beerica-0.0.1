class FixTables < ActiveRecord::Migration
  def change
    drop_table :brewery_table
    drop_table :states_table

    create_table :states do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :breweries do |t|
      t.string :name, null: false
      t.integer :state_id, null: false
      t.string :city, null: false
      t.string :street_address
      t.string :website
      t.string :phone
      t.string :hours_of_operation

      t.timestamps null: false
    end
  end
end

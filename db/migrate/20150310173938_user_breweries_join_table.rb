class UserBreweriesJoinTable < ActiveRecord::Migration
  def change
    create_table :user_breweries do |t|
      t.integer :user_id, null: false
      t.integer :brewery_id, null: false

      t.timestamps null: false
    end

  end
end

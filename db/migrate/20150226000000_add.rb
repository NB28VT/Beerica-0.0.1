class Add < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :cities, null: false

      t.timestamps null: false
    end
  end
end

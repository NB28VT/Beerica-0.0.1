class Drop < ActiveRecord::Migration
  def change
    drop_table :states_tables

    create_table :states_table do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end

end

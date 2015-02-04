class CreateStatesTable < ActiveRecord::Migration
  def change
    create_table :states_tables do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

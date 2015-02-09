class AddPerCapitaToStateTable < ActiveRecord::Migration
  def up
    add_column :states, :breweries_per_capita, :integer, null: false
  end

  def down
    remove_column :states, :breweries_per_capita, :integer
  end
end

class ChangeColumnStateBreweriesPerCapitaToFloat < ActiveRecord::Migration
  def up
    change_column :states, :breweries_per_capita, :float, null: false
  end

  def down
    change_column :states, :breweries_per_capita, :integer
  end
end

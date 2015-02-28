class Fix < ActiveRecord::Migration
  def change
    rename_column :cities, :cities, :name
  end
end

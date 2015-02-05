class DropNullConstraints < ActiveRecord::Migration
  def change
    change_column :breweries, :city, :string, null: true
  end
end

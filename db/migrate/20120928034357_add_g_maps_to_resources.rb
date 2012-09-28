class AddGMapsToResources < ActiveRecord::Migration
  def change
    add_column :resources, :latitude, :float
    add_column :resources, :longitude, :float
    add_column :resources, :gmaps, :boolean
  end
end

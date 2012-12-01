class AddTimeToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :entry, :integer
    add_column :patients, :exit, :integer
  end
end

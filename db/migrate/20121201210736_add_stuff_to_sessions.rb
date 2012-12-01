class AddStuffToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :entry, :integer
    add_column :sessions, :exit, :integer
  end
end

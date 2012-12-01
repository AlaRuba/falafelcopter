class AddStuffToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :entry, :integer
    add_column :sessions, :end, :integer
  end
end

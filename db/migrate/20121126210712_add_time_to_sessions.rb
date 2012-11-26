class AddTimeToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :start, :integer
    add_column :sessions, :finish, :integer
  end
end

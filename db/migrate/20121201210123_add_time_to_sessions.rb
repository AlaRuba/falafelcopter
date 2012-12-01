class AddTimeToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :start_time, :integer
    add_column :sessions, :end_time, :integer
  end
end

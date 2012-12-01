class RemoveStartTimeFromSessions < ActiveRecord::Migration
  def up
    remove_column :sessions, :start_time
  end

  def down
    add_column :sessions, :start_time, :datetime
  end
end

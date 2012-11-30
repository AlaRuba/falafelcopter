class RemoveTimeFromSessions < ActiveRecord::Migration
  def up
    remove_column :sessions, :start_time
    remove_column :sessions, :end
  end

  def down
    add_column :sessions, :end, :datetime
    add_column :sessions, :start_time, :datetime
  end
end

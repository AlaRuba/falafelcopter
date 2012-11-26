class AddRecordToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :start_time, :datetime
    add_column :sessions, :end, :datetime
  end
end

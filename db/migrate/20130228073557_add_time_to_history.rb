class AddTimeToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :date, :datetime
  end
end

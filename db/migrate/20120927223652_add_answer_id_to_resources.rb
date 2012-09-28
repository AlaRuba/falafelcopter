class AddAnswerIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :answer_id, :integer
  end
end

class AddFollowToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :follow, :boolean
  end
end

class AddNewQuestionsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :a5, :integer
    add_column :questions, :a6, :integer
    add_column :questions, :a7, :integer
    add_column :questions, :a8, :integer
  end
end

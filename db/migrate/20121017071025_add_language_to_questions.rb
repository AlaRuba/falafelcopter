class AddLanguageToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :language, :string
  end
end

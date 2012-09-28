class AddResourceBoolToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :resource_bool, :boolean
  end
end

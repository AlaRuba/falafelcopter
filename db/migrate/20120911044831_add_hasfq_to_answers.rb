class AddHasfqToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :hasfq, :boolean
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :id
      t.integer :question
      t.string :reply
      t.integer :resource
      t.integer :followup

      t.timestamps
    end
  end
end

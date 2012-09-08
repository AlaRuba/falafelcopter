class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :ask
      t.integer :follows
      t.integer :order
      t.integer :a1
      t.integer :a2
      t.integer :a3
      t.integer :a4

      t.timestamps
    end
  end
end

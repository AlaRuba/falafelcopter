class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :id
      t.string :responses

      t.timestamps
    end
  end
end

class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :answers

      t.timestamps
    end
  end
end

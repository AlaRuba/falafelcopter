class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :name
      t.text :address1
      t.text :address2
      t.text :city
      t.text :zipcode
      t.integer :phone1
      t.integer :phone2
      t.integer :phone3
      t.text :website
      t.text :instructions

      t.timestamps
    end
  end
end

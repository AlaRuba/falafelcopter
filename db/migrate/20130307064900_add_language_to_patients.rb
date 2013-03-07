class AddLanguageToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :language, :string
  end
end

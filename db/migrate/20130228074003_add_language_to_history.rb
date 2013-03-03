class AddLanguageToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :language, :string
  end
end

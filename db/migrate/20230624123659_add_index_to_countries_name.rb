class AddIndexToCountriesName < ActiveRecord::Migration[7.0]
  def change
    add_index :countries, :name
  end
end

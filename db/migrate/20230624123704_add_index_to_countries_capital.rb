class AddIndexToCountriesCapital < ActiveRecord::Migration[7.0]
  def change
    add_index :countries, :capital_city
  end
end

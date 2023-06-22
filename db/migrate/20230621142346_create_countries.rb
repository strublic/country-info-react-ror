class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :area_total
      t.integer :population_size
      t.string :capital_city

      t.timestamps
    end
  end
end

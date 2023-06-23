class AddDescToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :desc, :string
  end
end

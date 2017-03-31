class AddCityToAffiliates < ActiveRecord::Migration[5.0]
  def change
    add_column :affiliates, :city, :string
  end
end

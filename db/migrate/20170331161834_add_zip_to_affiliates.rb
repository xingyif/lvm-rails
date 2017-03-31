class AddZipToAffiliates < ActiveRecord::Migration[5.0]
  def change
    add_column :affiliates, :zip, :string
  end
end

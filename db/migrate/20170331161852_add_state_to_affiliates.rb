class AddStateToAffiliates < ActiveRecord::Migration[5.0]
  def change
    add_column :affiliates, :state, :string
  end
end

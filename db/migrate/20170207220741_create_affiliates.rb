class CreateAffiliates < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliates do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :twitter

      t.timestamps
    end
  end
end

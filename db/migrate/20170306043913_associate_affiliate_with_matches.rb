class AssociateAffiliateWithMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :affiliate_id, :integer
    add_index :matches, :affiliate_id
  end
end

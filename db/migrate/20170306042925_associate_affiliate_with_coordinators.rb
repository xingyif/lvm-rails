class AssociateAffiliateWithCoordinators < ActiveRecord::Migration[5.0]
  def change
    add_column :coordinators, :affiliate_id, :integer
    add_index :coordinators, :affiliate_id
  end
end

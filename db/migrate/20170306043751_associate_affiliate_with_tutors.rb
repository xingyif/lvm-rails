class AssociateAffiliateWithTutors < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :affiliate_id, :integer
    add_index :tutors, :affiliate_id
  end
end

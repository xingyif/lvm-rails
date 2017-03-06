class AssociateAffiliateWithStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :affiliate_id, :integer
    add_index :students, :affiliate_id
  end
end

class RemoveDuplicateAffiliateInTutor < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutors, :affiliate, :string
  end
end

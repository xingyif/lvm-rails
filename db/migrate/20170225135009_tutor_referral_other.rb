class TutorReferralOther < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :referral_other, :string
  end
end

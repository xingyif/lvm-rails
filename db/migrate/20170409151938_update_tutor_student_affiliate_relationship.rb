class UpdateTutorStudentAffiliateRelationship < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :affiliate_id
    remove_column :tutors, :affiliate_id

    rename_column :volunteer_jobs, :coordinator_id, :affiliate_id
    rename_column :enrollments, :coordinator_id, :affiliate_id
  end
end

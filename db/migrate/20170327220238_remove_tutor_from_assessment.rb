class RemoveTutorFromAssessment < ActiveRecord::Migration[5.0]
  def change
    remove_column :assessments, :tutor_id
  end
end

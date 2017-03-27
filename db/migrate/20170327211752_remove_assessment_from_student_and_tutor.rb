class RemoveAssessmentFromStudentAndTutor < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :assessment_id
    remove_column :tutors, :assessment_id
  end
end

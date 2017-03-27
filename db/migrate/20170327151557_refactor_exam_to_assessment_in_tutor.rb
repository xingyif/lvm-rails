class RefactorExamToAssessmentInTutor < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutors, :exam_id, :assessment_id
  end
end

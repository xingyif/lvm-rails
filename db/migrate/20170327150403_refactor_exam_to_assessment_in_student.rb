class RefactorExamToAssessmentInStudent < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :exam_id, :assessment_id
  end
end

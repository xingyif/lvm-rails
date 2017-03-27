class RenameExamToAssessment < ActiveRecord::Migration[5.0]
  def change
    rename_table :exams, :assessments
    rename_column :assessments, :exam_date, :date
  end
end

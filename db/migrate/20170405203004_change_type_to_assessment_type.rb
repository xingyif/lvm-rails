class ChangeTypeToAssessmentType < ActiveRecord::Migration[5.0]
  def change
    rename_column :assessments, :type, :assessment_type
  end
end

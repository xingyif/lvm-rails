class RenameAndAddColumnsInAssessment < ActiveRecord::Migration[5.0]
  def change
    rename_column :assessments, :subject, :category
    add_column :assessments, :name, :string
    add_column :assessments, :level, :string
    add_column :assessments, :type, :string
  end
end

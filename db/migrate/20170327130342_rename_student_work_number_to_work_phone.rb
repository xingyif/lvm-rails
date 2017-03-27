class RenameStudentWorkNumberToWorkPhone < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :work_number, :work_phone
  end
end

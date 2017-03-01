class UpdateStudentFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :address, :address1
    add_column :students, :address2, :string
    add_column :students, :smartt_id, :integer
  end
end

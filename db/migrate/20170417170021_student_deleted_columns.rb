class StudentDeletedColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :deleted_on, :date
    add_column :students, :deleted_by, :integer
  end
end

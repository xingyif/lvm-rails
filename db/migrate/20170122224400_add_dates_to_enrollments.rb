class AddDatesToEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_column :enrollments, :start, :date
    add_column :enrollments, :end, :date
  end
end

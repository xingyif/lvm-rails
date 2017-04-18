class TutorsDeletedColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :deleted_on, :date
    add_column :tutors, :deleted_by, :integer
  end
end

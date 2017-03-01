class RenameTutorDateFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutors, :orientation, :orientation_date
    rename_column :tutors, :training, :training_date
    rename_column :tutors, :intake, :intake_date
  end
end

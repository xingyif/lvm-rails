class TutorIntakeDate < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :intake, :date
  end
end

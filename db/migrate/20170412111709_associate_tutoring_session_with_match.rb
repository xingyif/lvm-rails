class AssociateTutoringSessionWithMatch < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutoring_sessions, :tutor_id
    remove_column :tutoring_sessions, :student_id
    add_column :tutoring_sessions, :match_id, :integer
  end
end

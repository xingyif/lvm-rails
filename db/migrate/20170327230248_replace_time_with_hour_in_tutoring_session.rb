class ReplaceTimeWithHourInTutoringSession < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutoring_sessions, :start_time
    remove_column :tutoring_sessions, :end_time
    add_column :tutoring_sessions, :hours, :integer
  end
end

class AddDateToTutoringSession < ActiveRecord::Migration[5.0]
  def change
    add_column :tutoring_sessions, :start_date, :date
    add_column :tutoring_sessions, :end_date, :date
  end
end

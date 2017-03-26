class CreateTutoringSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :tutoring_sessions do |t|
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.text :session_comment
      t.belongs_to :student, index: true
      t.belongs_to :tutor, index: true

      t.timestamps
    end
  end
end

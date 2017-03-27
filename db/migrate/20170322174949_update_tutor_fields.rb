class UpdateTutorFields < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :meet_at_local_library, :boolean
    add_column :tutors, :where_can_meet, :string
    add_column :tutors, :transportation, :integer
    add_column :tutors, :preferred_student_level, :string
    add_column :tutors, :other_preferences, :string

    # SMARTT IDs are not known at creation time
    change_column_null :tutors, :smartt_id, true
  end
end

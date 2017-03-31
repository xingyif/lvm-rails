class UpdateNewStudentFields < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :status, :string
    add_column :students, :status_date_of_change, :string, precence: false
    add_column :students, :status_changed_by, :string
    add_column :students, :last_name_id, :string
    add_column :students, :preferred_contact, :string
    add_column :students, :immigrant_status, :string
    add_column :students, :education, :string
    add_column :students, :services_requested, :text
    add_column :students, :additional_services_requested, :text
    add_column :students, :criminal_conviction, :boolean
    add_column :students, :release_on_file, :boolean
    add_column :students, :release_sign_date, :date
    add_column :students, :cdbg_required, :boolean
    add_column :students, :cdbg_us_citizen, :boolean
    add_column :students, :cdbg_legal_resident, :boolean
    add_column :students, :cdbg_female_head_of_household, :boolean
    add_column :students, :cdbg_household_size, :integer
    add_column :students, :cdbg_household_income, :integer
    add_column :students, :intake_date, :date
 
    # preferences
    remove_column :students, :tutor_preference
    add_column :students, :age_preference, :integer
    add_column :students, :meet_at_local_library, :boolean
    add_column :students, :where_can_meet, :string
    add_column :students, :transportation, :integer
    add_column :students, :other_preferences, :string
    
    # smartt required fields
    change_column_null :students, :first_name, false
    change_column_null :students, :last_name, false
    change_column_null :students, :gender, false
  end
end

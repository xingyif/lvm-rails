class AddRemainingTutorFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutors, :address,    :address1
    rename_column :tutors, :dob,        :date_of_birth
    rename_column :tutors, :employment, :employment_status

    change_column_null :tutors, :first_name,      false
    change_column_null :tutors, :last_name,       false
    change_column_null :tutors, :address1,        false
    change_column_null :tutors, :city,            false
    change_column_null :tutors, :state,           false
    change_column_null :tutors, :zip,             false
    change_column_null :tutors, :home_phone,      false
    change_column_null :tutors, :cell_phone,      false
    change_column_null :tutors, :email_preferred, false
    change_column_null :tutors, :occupation,      false
    change_column_null :tutors, :native_language, false
    change_column_null :tutors, :race,            false
    change_column_null :tutors, :date_of_birth,   false

    add_column :tutors, :address2,                          :string
    add_column :tutors, :emergency_contact_name,            :string
    add_column :tutors, :emergency_contact_phone,           :string
    add_column :tutors, :emergency_contact_email,           :string
    add_column :tutors, :preferred_contact_method,          :string
    add_column :tutors, :preferred_contact_class_listing,   :string
    add_column :tutors, :preferred_contact_data_collection, :string
    add_column :tutors, :status,                            :string
    add_column :tutors, :status_date_of_change,             :string
    add_column :tutors, :status_changed_by,                 :string
    add_column :tutors, :smartt_id,                         :string
    add_column :tutors, :last_name_id,                      :string
    add_column :tutors, :employer_name,                     :string
    add_column :tutors, :past_occupation,                   :string
    add_column :tutors, :colleges_attended,                 :text
    add_column :tutors, :educational_accomplishments,       :text
    add_column :tutors, :previous_teaching_experience,      :text
    add_column :tutors, :previous_volunteer_experience,     :text
    add_column :tutors, :teachable_subjects,                :text
    add_column :tutors, :hobbies,                           :text
    add_column :tutors, :reference,                         :string
    add_column :tutors, :language_proficiencies,            :text
    add_column :tutors, :hispanic_or_latino,                :boolean
    add_column :tutors, :country_of_birth,                  :string
    add_column :tutors, :country_leave_date,                :date
    add_column :tutors, :country_return_date,               :date
    add_column :tutors, :criminal_conviction,               :boolean
    add_column :tutors, :release_on_file,                   :boolean
    add_column :tutors, :release_sign_date,                 :date
    add_column :tutors, :affiliate_event_participation,     :string
    add_column :tutors, :affiliate_date_of_event,           :date

    change_column_null :tutors, :address2,                false
    change_column_null :tutors, :emergency_contact_name,  false
    change_column_null :tutors, :emergency_contact_phone, false
    change_column_null :tutors, :emergency_contact_email, false
    change_column_null :tutors, :smartt_id,               false
    change_column_null :tutors, :language_proficiencies,  false
    change_column_null :tutors, :hispanic_or_latino,      false
    change_column_null :tutors, :country_of_birth,        false
  end
end

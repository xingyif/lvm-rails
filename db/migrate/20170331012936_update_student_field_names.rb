class UpdateStudentFieldNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :alternate_number, :other_phone
    rename_column :students, :emergency_name, :emergency_contact_name
    rename_column :students, :emergency_number, :emergency_contact_phone
    rename_column :students, :dob, :date_of_birth
    rename_column :students, :is_hispanic, :hispanic_or_latino
    rename_column :students, :origin_country, :country_of_birth
    rename_column :students, :preferred_contact, :preferred_contact_method
    add_column :students, :referral_other, :string
    change_column :students, :why_lvm, :text
    rename_column :students, :services_requested, :core_service_request
    rename_column :students, :additional_services_requested, :additional_service_request
  end
end

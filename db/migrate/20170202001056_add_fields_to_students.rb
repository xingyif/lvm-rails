class AddFieldsToStudents < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :name
    # contact
    add_column :students, :first_name,       :string
    add_column :students, :last_name,        :string
    add_column :students, :dob,              :date
    add_column :students, :gender,           :string
    add_column :students, :address,          :string
    add_column :students, :city,             :string
    add_column :students, :state,            :string
    add_column :students, :zip,              :string
    add_column :students, :mail_ok,          :boolean
    add_column :students, :email,            :string
    add_column :students, :email_ok,         :boolean
    add_column :students, :cell_phone,       :string
    add_column :students, :cell_ok,          :boolean
    add_column :students, :cell_lvm_ok,      :boolean
    add_column :students, :home_phone,       :string
    add_column :students, :home_ok,          :boolean
    add_column :students, :home_lvm_ok,      :boolean
    add_column :students, :work_number,      :string
    add_column :students, :work_ok,          :boolean
    add_column :students, :work_lvm_ok,      :boolean
    add_column :students, :alternate_number, :string
    # emergency contact
    add_column :students, :emergency_name,   :string
    add_column :students, :emergency_number, :string
    # referral
    add_column :students, :referral,         :string
    add_column :students, :why_lvm,          :string
    # demographic
    add_column :students, :race,             :string
    add_column :students, :is_hispanic,      :boolean
    add_column :students, :native_language,  :string
    add_column :students, :origin_country,   :string
    # matching
    add_column :students, :availability,     :integer
    add_column :students, :tutor_preference, :integer
  end
end

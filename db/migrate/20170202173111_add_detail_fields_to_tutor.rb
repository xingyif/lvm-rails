class AddDetailFieldsToTutor < ActiveRecord::Migration[5.0]
  def change
    # We're transitioning from name to first and last components
    remove_column :tutors, :name

    add_column :tutors, :affiliate,       :string
    add_column :tutors, :first_name,      :string
    add_column :tutors, :last_name,       :string
    add_column :tutors, :address,         :string
    add_column :tutors, :city,            :string
    add_column :tutors, :state,           :string
    add_column :tutors, :zip,             :string
    add_column :tutors, :phone,           :string
    add_column :tutors, :cell_phone,      :string
    add_column :tutors, :gender,          :string
    add_column :tutors, :native_language, :string
    add_column :tutors, :race,            :string
    add_column :tutors, :training_type,   :string
    add_column :tutors, :referral,        :string
    add_column :tutors, :education,       :string
    add_column :tutors, :employment,      :string
    add_column :tutors, :occupation,      :string
    add_column :tutors, :orientation,     :date
    add_column :tutors, :training,        :date
    add_column :tutors, :dob,             :date
  end
end

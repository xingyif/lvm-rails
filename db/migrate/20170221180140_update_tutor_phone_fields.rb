class UpdateTutorPhoneFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutors, :phone, :home_phone
    add_column :tutors, :other_phone, :string
  end
end

class UpdateTutorEmails < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutors, :email, :email_preferred
    add_column :tutors, :email_other, :string
  end
end

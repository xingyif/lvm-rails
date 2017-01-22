class AddEmailToTutors < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :email, :string
  end
end

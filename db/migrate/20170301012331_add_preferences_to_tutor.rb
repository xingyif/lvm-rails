class AddPreferencesToTutor < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :availability, :integer
    add_column :tutors, :age_preference, :integer
    add_column :tutors, :category_preference, :integer
  end
end

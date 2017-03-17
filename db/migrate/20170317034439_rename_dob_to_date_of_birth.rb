class RenameDobToDateOfBirth < ActiveRecord::Migration[5.0]
  def change
    rename_column :coordinators, :dob, :date_of_birth
  end
end

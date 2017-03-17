class AddDobToCoordinators < ActiveRecord::Migration[5.0]
  def change
    add_column :coordinators, :dob, :date
  end
end

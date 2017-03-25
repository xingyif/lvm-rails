class UserTutorsAndCoordinators < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tutor_id, :integer
    add_column :users, :coordinator_id, :integer
  end
end

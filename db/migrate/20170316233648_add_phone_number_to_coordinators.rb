class AddPhoneNumberToCoordinators < ActiveRecord::Migration[5.0]
  def change
    add_column :coordinators, :phone_number, :string
  end
end

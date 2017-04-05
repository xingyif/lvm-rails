class CoordinatorNameToNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :coordinators, :name, :first_name

    add_column :coordinators, :last_name, :string
  end
end

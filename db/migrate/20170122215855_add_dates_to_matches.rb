class AddDatesToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :start, :date
    add_column :matches, :end, :date
  end
end

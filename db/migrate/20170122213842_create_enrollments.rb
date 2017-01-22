class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :student, index: true
      t.belongs_to :coordinator, index: true

      t.timestamps
    end
  end
end

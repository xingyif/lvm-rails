class AddStudentComments < ActiveRecord::Migration[5.0]
  def change
    create_table :student_comments do |t|
      t.belongs_to :student

      t.text :content, null: false

      t.timestamps
    end
  end
end

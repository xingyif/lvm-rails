class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :score
      t.datetime :exam_date
      t.string :subject
      t.belongs_to :student, index: true
      t.belongs_to :tutor, index: true

      t.timestamps
    end
  end
end

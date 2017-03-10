class AddExamToStudentTutor < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :exam_id, :integer
    add_index  :students, :exam_id

    add_column :tutors, :exam_id, :integer
    add_index :tutors, :exam_id
  end
end

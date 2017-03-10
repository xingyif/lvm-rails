class ChangeDatetimeToDateInExam < ActiveRecord::Migration[5.0]
  def change
    change_column :exams, :exam_date, :date
  end
end

class Assessment < ApplicationRecord
  belongs_to :student

  validates :score, presence: true, length: { maximum: 6 }
  validates :category, presence: true
  validates :name, presence: true
  validates :level, presence: true
  validates :assessment_type, presence: true
  validates :date, presence: true
  validates :student_id, presence: true
end

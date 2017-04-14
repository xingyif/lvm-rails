class StudentComment < ApplicationRecord
  belongs_to :student

  validates :content, presence: true
  validates :student, presence: true
end

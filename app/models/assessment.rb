class Assessment < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  validates :score, presence: true, length: { maximum: 6 }
end

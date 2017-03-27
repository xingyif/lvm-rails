class Assessment < ApplicationRecord
  belongs_to :student

  validates :score, presence: true, length: { maximum: 6 }
end

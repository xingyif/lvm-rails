class Enrollment < ApplicationRecord
  belongs_to :affiliate
  belongs_to :student

  validates :affiliate, presence: true
  validates :student, presence: true
end

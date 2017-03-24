class TutoringSession < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  validates :location,     presence: true
  validates :start_time,   presence: true
  validates :end_time,     presence: true
  # validates :student,      presence: true
  # validates :tutor,        presence: true
end

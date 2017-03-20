class TutoringSession < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  validates :location,     presense: true
  validates :start_time,   presense: true
  validates :end_time,     presense: true
end

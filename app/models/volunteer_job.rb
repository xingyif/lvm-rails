class VolunteerJob < ApplicationRecord
  belongs_to :affiliate
  belongs_to :tutor

  validates :affiliate, presence: true
  validates :tutor, presence: true
end

class VolunteerJob < ApplicationRecord
  belongs_to :coordinator
  belongs_to :tutor
end

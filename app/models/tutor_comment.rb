class TutorComment < ApplicationRecord
  belongs_to :tutor

  validates :content, presence: true
  validates :tutor,   presence: true
end

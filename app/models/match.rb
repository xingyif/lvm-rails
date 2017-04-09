class Match < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  validates_presence_of :start
  validate :matching_member_affiliates

  def matching_member_affiliates
    return if tutor.active_affiliate.id == student.active_affiliate.id
    errors.add(:student, 'Student must belong to same affiliate as tutor.')
  end
end

class Match < ApplicationRecord
  before_save :set_affiliate
  belongs_to :tutor
  belongs_to :student
  belongs_to :affiliate

  validates_presence_of :start
  validate :matching_member_affiliates

  def set_affiliate
    # Odd choice of activerecord hopping for purposes of seeding smoothness
    self.affiliate_id =
      Enrollment.where(student_id: student_id).take.affiliate_id
  end

  def matching_member_affiliates
    return if tutor.active_affiliate.id == student.active_affiliate.id
    errors.add(:student, 'Student must belong to same affiliate as tutor.')
  end
end

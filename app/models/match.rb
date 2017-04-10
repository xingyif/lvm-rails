class Match < ApplicationRecord
  before_save :set_affiliate
  belongs_to :tutor
  belongs_to :student
  belongs_to :affiliate
  has_many :tutoring_sessions

  validates_presence_of :start
  validate :matching_member_affiliates
  validate :not_duplicate_match

  def set_affiliate
    # Odd choice of activerecord hopping for purposes of seeding smoothness
    self.affiliate_id =
      Enrollment.where(student_id: student_id).take.affiliate_id
  end

  def matching_member_affiliates
    return if tutor.active_affiliate.id == student.active_affiliate.id
    errors.add(:student, 'Student must belong to same affiliate as tutor.')
  end

  def not_duplicate_match
    existing_matches = Match.where(
      student_id: student.id,
      tutor_id: tutor.id,
      end: nil
    )
    return unless existing_matches.count > 0
    errors.add(:student_id, 'Student and tutor are already matched')
  end
end

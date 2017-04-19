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
    ).where.not(id: id)
    return if existing_matches.count.zero?
    errors.add(:student_id, 'Student and tutor are already matched')
  end

  def student_first_name
    Student.find(student_id).first_name
  end

  def student_last_name
    Student.find(student_id).last_name
  end

  def tutor_first_name
    Tutor.find(tutor_id).first_name
  end

  def tutor_last_name
    Tutor.find(tutor_id).last_name
  end

  def self.of(user)
    if user.admin?
      all
    elsif user.coordinator?
      where(
        affiliate_id: Coordinator.find(
          user.coordinator_id
        ).affiliate_id
      )
    end
  end
end

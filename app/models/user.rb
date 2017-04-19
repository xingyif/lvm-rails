class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :coordinator
  has_one :tutor

  validate :single_account_type
  validates_numericality_of :role, in: 0..2

  def tutor?
    role.zero?
  end

  def coordinator?
    role == 1
  end

  def admin?
    role == 2
  end

  def single_account_type
    return unless coordinator_id && tutor_id
    errors.add(:account_type, "Can't be tutor and coordinator")
  end

  def last_sign_in_string
    if last_sign_in_at
      last_sign_in_at.strftime('%F')
    else
      'Never Signed In'
    end
  end

  def created_at_string
    created_at.strftime('%F')
  end

  def role_string
    if role.zero?
      'Tutor'
    elsif role == 1
      'Coordinator'
    else
      'Admin'
    end
  end
end

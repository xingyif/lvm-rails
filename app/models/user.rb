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
end

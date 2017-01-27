class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_numericality_of :role, in: 0..2

  # Role management as follows
  # 0 => tutor (default)
  # 1 => coordinator
  # 2 => admin
  def tutor?
    role.zero?
  end

  def coordinator?
    role == 1
  end

  def admin?
    role == 2
  end

  def coordinator_level?
    role >= 1
  end

  def admin_level?
    role >= 2
  end
end

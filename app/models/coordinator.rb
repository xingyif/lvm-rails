class Coordinator < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\([0-9]{3}\) [0-9]{3}-[0-9]{4}\z/
  belongs_to :affiliate
  belongs_to :user

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :date_of_birth, presence: true
  validates :phone_number, presence: true
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone_number, format: { with: VALID_PHONE_REGEX }

  def name
    [first_name, last_name].join(' ')
  end
end

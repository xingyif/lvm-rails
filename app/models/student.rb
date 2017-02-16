class Student < ApplicationRecord
  has_many :matches
  has_many :tutors, through: :matches

  has_many :enrollments
  has_many :coordinators, through: :enrollments

  validates :first_name, presence: true, length: { minimum: 3 }

  def name
    [first_name, last_name].join(' ')
  end
end

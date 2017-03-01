class Student < ApplicationRecord
  has_many :matches
  has_many :tutors, through: :matches

  has_many :enrollments
  has_many :coordinators, through: :enrollments

  validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :dob, presence: true
  # validates :gender, presence: true
  # validates :smartt_id, presence: true
  # validates :address1, presence: true
  # validates :address2, presence: true
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :zip, presence: true
  # validates :home_phone, presence: true
  # validates :cell_phone, presence: true
  # # validate occupation or title
  # validates :native_language, presence: true
  # # other language proficiency
  # validates :race, presence: true
  # validates :is_hispanic, presence: true
  # validates :origin_country, presence: true

  def name
    [first_name, last_name].join(' ')
  end
end

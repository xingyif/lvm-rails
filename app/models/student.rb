class Student < ApplicationRecord
  VALID_EMAIL_REGEX  = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX  = /\A\([0-9]{3}\) [0-9]{3}-[0-9]{4}\z/
  VALID_ZIP_REGEX    = /\A[0-9]{5}\z/
  VALID_SMARTT_REGEX = /\A[0-9]{4}-[0-9]{6}\z/
  LAST_NAME_ID_REGEX = /\A[0-9]{4,5}\z/

  has_many :matches
  has_many :tutors, through: :matches

  has_many :enrollments
  has_many :coordinators, through: :enrollments
  has_many :assessments

  has_many :affiliates
  # has_many :student_comments

  has_many :taggings
  has_many :tags, through: :taggings

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :dob, presence: true
  validates :gender, presence: true
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
  validates :cell_phone,   format: { with: VALID_PHONE_REGEX },
                           allow_blank: true
  validates :home_phone,   format: { with: VALID_PHONE_REGEX },
                           allow_blank: true
  validates :last_name_id, format: { with: LAST_NAME_ID_REGEX },
                           allow_blank: true
  validates :work_phone, format: { with: VALID_PHONE_REGEX },
                         allow_blank: true
  validates :alternate_number,  format: { with: VALID_PHONE_REGEX },
                                allow_blank: true
  validates :emergency_number,  format: { with: VALID_PHONE_REGEX },
                                allow_blank: true
  validates :smartt_id,    format: { with: VALID_SMARTT_REGEX },
                           allow_blank: true
  validates :zip,          format: { with: VALID_ZIP_REGEX },
                           allow_blank: true
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    allow_blank: true

  def name
    [first_name, last_name].join(' ')
  end

  def current_availability_array
    availability ? PreferencesHelper.explode(availability) : []
  end

  def age_preference_array
    age_preference ? PreferencesHelper.explode(age_preference) : []
  end

  def transportation_preference_array
    transportation ? PreferencesHelper.explode(transportation) : []
  end

  def all_tags=(names)
    self.tags = names.reject(&:empty?).uniq.map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name)
  end

  # rubocop:disable CyclomaticComplexity, PerceivedComplexity
  def status_class_indicator
    active  = ['Active']
    info    = ['Waiting for re-match', 'Waiting for 1st match', 'On hold']
    warning = ['Declined match', 'Unable to contact', 'Cannot match', 'Moved']
    danger  = ['Exited', 'No show to appointment', 'Dropped out of training']

    klass = ('success' if active.include? status)  ||
            ('info'    if info.include? status)    ||
            ('warning' if warning.include? status) ||
            ('danger'  if danger.include? status)
    klass
  end
end

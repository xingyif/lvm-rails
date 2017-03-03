class Tutor < ApplicationRecord
  VALID_EMAIL_REGEX  = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX  = /\A\(?[0-9]{3}\)?(-|\s)?[0-9]{3}-[0-9]{4}\z/
  VALID_ZIP_REGEX    = /\A[0-9]{5}\z/
  VALID_SMARTT_REGEX = /\A[0-9]{4}-[0-9]{6}\z/
  LAST_NAME_ID_REGEX = /\A[0-9]{1,5}\z/

  has_many :matches
  has_many :students, through: :matches

  has_many :volunteer_jobs
  has_many :coordinators, through: :volunteer_jobs

  validates :address1,                presence: true
  validates :address2,                presence: true
  validates :cell_phone,              presence: true
  validates :city,                    presence: true
  validates :country_of_birth,        presence: true
  validates :date_of_birth,           presence: true
  validates :email_preferred,         presence: true
  validates :emergency_contact_email, presence: true
  validates :emergency_contact_name,  presence: true
  validates :emergency_contact_phone, presence: true
  validates :first_name,              presence: true
  validates :home_phone,              presence: true
  validates :language_proficiencies,  presence: true
  validates :last_name,               presence: true
  validates :native_language,         presence: true
  validates :occupation,              presence: true
  validates :race,                    presence: true
  validates :smartt_id,               presence: true
  validates :state,                   presence: true
  validates :zip,                     presence: true

  # can't use presence: true for bool
  validates_inclusion_of :hispanic_or_latino, in: [true, false]

  validates :cell_phone,   format: { with: VALID_PHONE_REGEX }
  validates :home_phone,   format: { with: VALID_PHONE_REGEX }
  validates :last_name_id, format: { with: LAST_NAME_ID_REGEX },
                           allow_blank: true
  validates :other_phone,  format: { with: VALID_PHONE_REGEX },
                           allow_blank: true
  validates :smartt_id,    format: { with: VALID_SMARTT_REGEX }
  validates :zip,          format: { with: VALID_ZIP_REGEX }

  validates :email_preferred, length: { maximum: 255 },
                              format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false }
  validates :email_other,     length: { maximum: 255 },
                              format: { with: VALID_EMAIL_REGEX },
                              uniqueness: { case_sensitive: false },
                              allow_blank: true
  def name
    [first_name, last_name].join(' ')
  end

  def current_availability_array
    availability ? PreferencesHelper.explode(availability) : []
  end

  def category_preference_array
    category_preference ? PreferencesHelper.explode(category_preference) : []
  end

  def age_preference_array
    age_preference ? PreferencesHelper.explode(age_preference) : []
  end
end

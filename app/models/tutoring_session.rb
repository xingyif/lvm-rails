class TutoringSession < ApplicationRecord
  belongs_to :match

  validates_presence_of :match
  validates :location, presence: true
  validates :hours, presence: true,
                    length: { maximum: 2 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_before_end

  def start_before_end
    # first two options allow specs to pass without compromising validations
    # since presence is validated above
    return if !start_date || !end_date || start_date <= end_date
    errors.add(:end_date, 'may not be before start date.')
  end
end

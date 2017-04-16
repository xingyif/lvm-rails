class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :students, through: :taggings
  has_many :tutors, through: :taggings

  validates_uniqueness_of :name
  validates :name, length: { minimum: 1 }

  def count
    Tagging.where(tag_id: id).count
  end

  def created_string
    created_at.strftime('%D')
  end

  def updated_string
    updated_at.strftime('%D')
  end
end

class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :students, through: :taggings
  has_many :tutors, through: :taggings

  validates_uniqueness_of :name

  def count
    Tagging.where(tag_id: id).count
  end
end

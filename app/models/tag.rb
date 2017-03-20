class Tag < ApplicationRecord
  has_many :taggings
  has_many :students, through: :taggings
  has_many :tutors, through: :taggings
end

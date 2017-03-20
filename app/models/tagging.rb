class Tagging < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
  belongs_to :tag
end

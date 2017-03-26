class Match < ApplicationRecord
  belongs_to :tutor
  belongs_to :student
  has_many :affiliates
end

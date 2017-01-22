class Enrollment < ApplicationRecord
  belongs_to :coordinator
  belongs_to :student
end

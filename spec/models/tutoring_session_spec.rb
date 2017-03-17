require 'rails_helper'

RSpec.describe 'Tutoring_Session', type: :model do
  xdescribe 'associations' do
    it 'should belong to a student' do
      should belong_to(:student)
    end

    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end
  end

  xdescribe 'validations' do
    it 'validates location presence' do
      should validate_presence_of(:location)
    end
    it 'validates start_time presence' do
      should validate_presence_of(:start_time)
    end
    it 'validates end_time presence' do
      should validate_presence_of(:end_time)
    end
    it 'validates comment presence' do
      should validate_presence_of(:comment)
    end
  end
end

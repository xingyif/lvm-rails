require 'rails_helper'

RSpec.describe TutoringSession, type: :model do
  describe 'associations' do
    it 'should belong to a student' do
      should belong_to(:student)
    end

    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end
  end

  describe 'validations' do
    it 'validates location presence' do
      should validate_presence_of(:location)
    end
    it 'validates hours presence' do
      should validate_presence_of(:hours)
    end
    it 'validates start_date presence' do
      should validate_presence_of(:start_date)
    end
    it 'validates end_date presence' do
      should validate_presence_of(:end_date)
    end
  end
end

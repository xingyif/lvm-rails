require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe 'associations' do
    it 'should belong to a student' do
      should belong_to(:student)
    end

    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end
  end

  describe 'validations' do
    it 'validates score presence' do
      should validate_presence_of(:score)
    end
    it 'validates score length' do
      should validate_length_of(:score)
        .is_at_most(6)
    end
  end
end

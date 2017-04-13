require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe 'associations' do
    it 'should belong to a student' do
      should belong_to(:student)
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
    it 'validates category presence' do
      should validate_presence_of(:category)
    end
    it 'validates name presence' do
      should validate_presence_of(:name)
    end
    it 'validates level presence' do
      should validate_presence_of(:level)
    end
    it 'validates assessment_type presence' do
      should validate_presence_of(:assessment_type)
    end
    it 'validates date presence' do
      should validate_presence_of(:date)
    end
    it 'validates student_id presence' do
      should validate_presence_of(:student_id)
    end
  end
end

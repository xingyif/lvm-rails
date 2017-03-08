require 'rails_helper'

RSpec.describe TutorComment, type: :model do
  describe 'associations' do
    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end
  end

  describe 'validations' do
    describe 'content' do
      it 'validates presence' do
        should validate_presence_of(:content)
      end
    end

    describe 'tutor' do
      it 'validates presence' do
        should validate_presence_of(:tutor)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'associations' do
    it 'should belong to a tag' do
      should belong_to(:tag)
    end

    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end

    it 'should belong to a student' do
      should belong_to(:student)
    end
  end
end

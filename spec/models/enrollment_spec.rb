require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe 'associations' do
    it 'should belong to a affiliate' do
      should belong_to(:affiliate)
    end

    it 'should belong to a student' do
      should belong_to(:student)
    end
  end
end

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it 'should have many taggings' do
      should have_many(:taggings)
    end

    it 'should have many tutors and students through taggings' do
      should have_many(:tutors).through(:taggings)
      should have_many(:students).through(:taggings)
    end
  end
end

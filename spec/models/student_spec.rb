require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'associations' do
    it 'should have many matches' do
      should have_many(:matches)
    end

    it 'tutors through matches' do
      should have_many(:tutors).through(:matches)
    end

    it 'should have many enrollments' do
      should have_many(:enrollments)
    end

    it 'coordinators through enrollments' do
      should have_many(:coordinators).through(:enrollments)
    end
  end

  describe 'validations' do
    describe 'name' do
      it 'validates presence' do
        should validate_presence_of(:name)
      end

      it 'validates length' do
        should validate_length_of(:name)
          .is_at_least(3)
          .on(:create)
      end
    end
  end
end

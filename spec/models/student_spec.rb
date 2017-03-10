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

    it 'should have many exams' do
      should have_many(:exams)
    end
  end

  describe 'validations' do
    # TODO: add validation
  end

  describe '#name' do
    it 'concatenates first_name and last_name' do
      student = create(:student, first_name: 'Test', last_name: 'Testerson')
      full_name = 'Test Testerson'
      expect(student.name).to eq(full_name)
    end
  end
end

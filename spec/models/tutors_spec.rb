require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'associations' do
    it 'should have many matches' do
      should have_many(:matches)
    end

    it 'students through matches' do
      should have_many(:students).through(:matches)
    end

    it 'should have many volunteer_jobs' do
      should have_many(:volunteer_jobs)
    end

    it 'coordinators through volunteer_jobs' do
      should have_many(:coordinators).through(:volunteer_jobs)
    end
  end

  describe 'validations' do
    describe 'name' do
      it 'validates presence' do
        should validate_presence_of(:first_name)
        should validate_presence_of(:last_name)
      end
    end

    describe 'phone numbers' do
      it 'validates format' do
        should allow_value('(555) 555-5555').for(:phone)
        should allow_value('555-555-5555').for(:phone)
        should_not allow_value('43-4343-4444').for(:phone)
        should_not allow_value('434-3433-4444').for(:phone)
        should_not allow_value('434-434-444').for(:phone)
        should_not allow_value('4333-433-4444').for(:phone)
        should_not allow_value('(232) 343-99439').for(:phone)
        should_not allow_value('(abc) 123-defg').for(:phone)
      end
    end

    describe 'zip' do
      it 'validates format' do
        should allow_value('03923').for(:zip)
        should allow_value('54321').for(:zip)
        should_not allow_value('1234').for(:zip)
        should_not allow_value('123456').for(:zip)
        should_not allow_value('abcde').for(:zip)
      end
    end

    describe 'email' do
      it 'validates presence' do
        should validate_presence_of(:email)
      end

      it 'validates length' do
        should validate_length_of(:email)
          .is_at_most(255)
      end

      it 'validates format' do
        should allow_value('email@address.foo').for(:email)
        should_not allow_value('foo').for(:email)
        should_not allow_value('foo@').for(:email)
        should_not allow_value('foo@address').for(:email)
        should_not allow_value('address.foo').for(:email)
      end

      it 'validates uniqueness' do
        should validate_uniqueness_of(:email).case_insensitive
      end
    end
  end

  describe '#name' do
    it 'concatenates first_name and last_name' do
      student = create(:student, first_name: 'Test', last_name: 'Testerson')
      full_name = 'Test Testerson'
      expect(student.name).to eq(full_name)
    end
  end
end

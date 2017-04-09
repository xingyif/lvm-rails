require 'rails_helper'

RSpec.describe Coordinator, type: :model do
  describe 'associations' do
    it 'should belond to an affiliate' do
      should belong_to(:affiliate)
    end
  end

  describe 'validations' do
    describe 'first_name' do
      it 'validates presence' do
        should validate_presence_of(:first_name)
      end

      it 'validates length' do
        should validate_length_of(:first_name)
          .is_at_most(50)
      end
    end

    describe 'last_name' do
      it 'validates presence' do
        should validate_presence_of(:last_name)
      end

      it 'validates length' do
        should validate_length_of(:last_name)
          .is_at_most(50)
      end
    end

    describe 'phone_number' do
      it 'validates presence' do
        should validate_presence_of(:phone_number)
      end

      it 'validates format' do
        should allow_value('(555) 555-5555').for(:phone_number)
        should_not allow_value('555-555-5555').for(:phone_number)
        should_not allow_value('43-4343-4444').for(:phone_number)
        should_not allow_value('434-3433-4444').for(:phone_number)
        should_not allow_value('434-434-444').for(:phone_number)
        should_not allow_value('4333-433-4444').for(:phone_number)
        should_not allow_value('(232) 343-99439').for(:phone_number)
        should_not allow_value('(abc) 123-defg').for(:phone_number)
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
end

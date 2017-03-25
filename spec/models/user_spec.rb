require 'rails_helper'

RSpec.describe User, type: :model do
  context 'tutor' do
    before do
      @user = User.new
    end

    it 'defaults a new user to the tutor role' do
      expect(@user.role).to eq(0)
      expect(@user.tutor?).to be_truthy
    end
  end

  context 'coordinator' do
    before do
      @user = User.new(role: 1)
    end

    it 'ensures coordinators have role 1' do
      expect(@user.role).to eq(1)
      expect(@user.coordinator?).to be_truthy
    end
  end

  context 'admin' do
    before do
      @user = User.new(role: 2)
    end

    it 'ensures admins have role 2' do
      expect(@user.role).to eq(2)
      expect(@user.admin?).to be_truthy
    end
  end

  describe 'single_account_type' do
    before(:each) do
      @user = User.new(role: 0,
                       email: 'a@b.co',
                       password: 'abcdef',
                       password_confirmation: 'abcdef')
    end

    describe 'when the user is associated with only a tutor' do
      it 'validate' do
        @user.tutor_id = 1
        @user.save
        expect(User.count).to eq(1)
      end
    end

    describe 'when the user is associated with only a coordinator' do
      it 'validate' do
        @user.coordinator_id = 1
        @user.save
        expect(User.count).to eq(1)
      end
    end

    describe 'when the user is associated with a tutor and coordinator' do
      it 'does not validate' do
        @user.tutor_id = 1
        @user.coordinator_id = 1
        @user.save
        expect(User.count).to eq(0)
      end
    end
  end
end

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

    it 'does not have any permission levels' do
      expect(@user.coordinator_level?).to be_falsey
      expect(@user.admin_level?).to be_falsey
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

    it 'correctly defines the access level for coordinators' do
      expect(@user.coordinator_level?).to be_truthy
      expect(@user.admin_level?).to be_falsey
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

    it 'correctly defines the access level for coordinators' do
      expect(@user.coordinator_level?).to be_truthy
      expect(@user.admin_level?).to be_truthy
    end
  end
end

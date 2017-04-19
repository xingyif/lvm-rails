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

  describe 'methods' do
    describe '#last_sign_in_string' do
      describe 'having signed in' do
        it 'produces the proper date string' do
          user = User.new(role: 0,
                          email: 'a@b.com',
                          password: 'abcdef',
                          password_confirmation: 'abcdef',
                          last_sign_in_at: Time.at(949_320_000))

          expect(user.last_sign_in_string).to eq '2000-01-31'
        end

        describe 'never having signed in' do
          it 'produces the proper notice string' do
            user = User.new(role: 0,
                            email: 'a@b.com',
                            password: 'abcdef',
                            password_confirmation: 'abcdef')

            expect(user.last_sign_in_string).to eq 'Never Signed In'
          end
        end
      end
    end

    describe '#updated_string' do
      it 'produces the proper date string' do
        user = User.new(role: 0,
                        email: 'a@b.com',
                        password: 'abcdef',
                        password_confirmation: 'abcdef',
                        created_at: Time.at(949_320_000))
        expect(user.created_at_string).to eq '2000-01-31'
      end
    end

    describe '#role_string' do
      describe 'tutor' do
        it 'produces the proper role string' do
          user = User.new(role: 0,
                          email: 'a@b.com',
                          password: 'abcdef',
                          password_confirmation: 'abcdef')
          expect(user.role_string).to eq 'Tutor'
        end
      end

      describe 'coordinator' do
        it 'produces the proper role string' do
          user = User.new(role: 1,
                          email: 'a@b.com',
                          password: 'abcdef',
                          password_confirmation: 'abcdef')
          expect(user.role_string).to eq 'Coordinator'
        end
      end

      describe 'admin' do
        it 'produces the proper role string' do
          user = User.new(role: 2,
                          email: 'a@b.com',
                          password: 'abcdef',
                          password_confirmation: 'abcdef')
          expect(user.role_string).to eq 'Admin'
        end
      end
    end
  end
end

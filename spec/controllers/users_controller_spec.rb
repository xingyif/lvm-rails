require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'endpoints' do
    before do
      @user = User.create(role: 0,
                          email: 'a@b.com',
                          password: 'password',
                          password_confirmation: 'password')

      @login_user = User.create(role: 2,
                                email: 'b@b.com',
                                password: 'password',
                                password_confirmation: 'password')
      sign_in_auth(@login_user)
    end

    describe 'GET #index' do
      describe 'as admin' do
        it 'populates an array of all users' do
          get :index
          expect(assigns(:models)).to eq([@user, @login_user])
        end

        it 'renders the :index view' do
          get :index

          expect(response).to render_template :index
        end
      end

      describe 'as coordinator' do
        before do
          user = User.new(role: 1, coordinator_id: 1)
          sign_in_auth(user)
        end

        it 'redirects to the welcome view' do
          get :index

          expect(response).to redirect_to root_path
        end
      end

      describe 'as tutor' do
        before do
          user = User.new(role: 0, tutor_id: 1)
          sign_in_auth(user)
        end

        it 'redirects to the welcome view' do
          get :index

          expect(response).to redirect_to root_path
        end
      end
    end

    describe 'GET #show' do
      it 'populates the specified user' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq(@user)
      end

      it 'renders the :show view' do
        get :show, params: { id: @user.id }
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it 'populates a new user' do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it 'populates the specified user' do
        get :edit, params: { id: @user.id }
        expect(assigns(:user)).to eq(@user)
      end

      it 'renders the :edit view' do
        get :edit, params: { id: @user }
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
      before do
        @user_attrs = { role: 0,
                        email: 'c@c.com',
                        password: 'password',
                        passwords_confirmation: 'password' }
      end

      context 'with valid attributes' do
        it 'saves the new tutor in the database' do
          post :create, params: { user: @user_attrs }
          expect(assigns(:user)).to be_persisted
        end

        it 'assigns the newly created tutor as @user' do
          post :create, params: { user: @user_attrs }
          expect(assigns(:user)).to be_a(User)
        end

        it 'redirects to the newly created user view' do
          post :create, params: { user: @user_attrs }
          expect(response).to redirect_to(User.last)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(User).to receive(:save) { false }
        end

        it 'assigns a newly created but unsaved user as @tutor' do
          post :create, params: { user: @user_attrs }
          expect(assigns(:user)).to be_a_new(User)
        end

        it 're-renders the :new view' do
          post :create, params: { user: @user_attrs }
          # not ideal, explained in the controller
          expect(response).to redirect_to new_user_path
        end
      end
    end

    describe 'PUT #update' do
      before do
        @new_user_attrs = { email: 'c@c.com' }
      end

      context 'with valid attributes' do
        context 'with a password' do
          pw_params = { email: 'c@c.com',
                        password: 'abcdef',
                        password_confirmation: 'abcdef' }
          it 'saves the updated user in the database' do
            post :update, params: { id: @user.id, user: pw_params }
            expect(User.find(@user.id).email).to eq(@new_user_attrs[:email])
          end
        end

        it 'saves the updated user in the database' do
          post :update, params: { id: @user.id, user: @new_user_attrs }
          expect(User.find(@user.id).email).to eq(@new_user_attrs[:email])
        end

        it 'assigns the updated user as @user' do
          post :update, params: { id: @user.id, user: @new_user_attrs }
          expect(assigns(:user).email).to eq(@new_user_attrs[:email])
        end

        it 'redirects to the user view' do
          post :update, params: { id: @user.id, user: @new_user_attrs }
          expect(response).to redirect_to(@user)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(User).to receive(:update) { false }
        end

        it 'assigns the existing tutor as @tutor' do
          post :update, params: { id: @user.id, user: @new_user_attrs }
          expect(assigns(:user)).to eq(@user)
        end

        it 're-renders the :edit view' do
          post :update, params: { id: @user.id, user: @new_user_attrs }
          expect(response).to render_template :edit
        end
      end
    end
  end
end

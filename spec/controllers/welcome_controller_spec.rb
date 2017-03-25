require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe '#index' do
    describe 'when authenticated' do
      before do
        user = User.new(role: 2)
        sign_in_auth(user)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns success status' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    describe 'when not authenticated' do
      before do
        sign_in_auth nil
      end

      it 'redirects to the sign in page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'returns redirect status' do
        get :index
        expect(response.status).to eq(302)
      end
    end
  end
end

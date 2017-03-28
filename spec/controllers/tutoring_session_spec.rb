require 'rails_helper'

RSpec.describe TutoringSessionsController, type: :controller do
  let(:valid_session) { {} }
  describe 'endpoints' do
    before do
      sign_in_auth
      @tutoring_session = create(:tutoring_session)
      @tutoring_session_attrs = attributes_for(:tutoring_session)
    end

    describe 'GET #index' do
      it 'populates an array of tutoring_session' do
        get :index
        expect(assigns(:tutoring_sessions)).to eq([@tutoring_session])
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET #show' do
      it 'shows the specified tutoring_session' do
        get :show, params: { id: @tutoring_session }
        expect(assigns(:tutoring_session)).to eq(@tutoring_session)
      end

      it 'renders the :show view' do
        get :show, params: { id: @tutoring_session }
        expect(response).to render_template('show')
      end
    end

    describe 'GET #new' do
      it 'creates a new tutoring_session' do
        get :new
        expect(assigns(:tutoring_session)).to be_a_new(TutoringSession)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template('new')
      end
    end

    describe 'GET #edit' do
      it 'modifies the specific tutoring_session' do
        get :edit, params: { id: @tutoring_session }
        expect(assigns(:tutoring_session)).to eq(@tutoring_session)
      end

      it 'render the :edit view' do
        get :edit, params: { id: @tutoring_session }
        expect(response).to render_template('edit')
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'saves the new tutoring_session to the database' do
          post :create, params: { tutoring_session: @tutoring_session_attrs },
                        session: valid_session
          expect(assigns(:tutoring_session)).to be_persisted
        end

        it 'assigns newly created tutoring_session as @tutoring_session' do
          post :create, params: { tutoring_session: @tutoring_session_attrs },
                        session: valid_session
          expect(assigns(:tutoring_session)).to be_a(TutoringSession)
        end

        it 'redirects to the newly created tutoring_session view' do
          post :create, params: { tutoring_session: @tutoring_session_attrs },
                        session: valid_session
          expect(response).to redirect_to(TutoringSession.last)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(TutoringSession).to receive(:save) { false }
        end

        it 'assigned a newly created but unsaved tutoring_session
            as @tutoring_session' do
          post :create, params: { tutoring_session: @tutoring_session_attrs },
                        session: valid_session
          expect(assigns(:tutoring_session)).to be_a_new(TutoringSession)
        end

        it 're-renders the new tutoring_session view' do
          post :create, params: { tutoring_session: @tutoring_session_attrs },
                        session: valid_session
          expect(response).to render_template :new
        end
      end
    end

    describe 'POST #update' do
      context 'with valid attributes' do
        it 'saves the updated tutoring_session to the database' do
          post :update, params: { id: @tutoring_session,
                                  tutoring_session: @tutoring_session_attrs }
          expect(TutoringSession.last).to eq(@tutoring_session)
        end

        it 'assigns the updated tutoring_session as @tutoring_session' do
          post :update, params: { id: @tutoring_session,
                                  tutoring_session: @tutoring_session_attrs }
          expect(assigns(:tutoring_session)).to eq(@tutoring_session)
        end

        it 'redirects to the tutoring_session view' do
          post :update, params: { id: @tutoring_session,
                                  tutoring_session: @tutoring_session_attrs }
          expect(response).to redirect_to(@tutoring_session)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(TutoringSession).to receive(:update) { false }
        end

        it 'assigns the existing tutoring_session as @tutoring_session' do
          post :update, params: { id: @tutoring_session,
                                  tutoring_session: @tutoring_session_attrs }
          expect(assigns(:tutoring_session)).to eq(@tutoring_session)
        end

        it 're-renders the :edit view' do
          post :update, params: { id: @tutoring_session,
                                  tutoring_session: @tutoring_session_attrs }
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the tutoring_session' do
        expect { delete :destroy, params: { id: @tutoring_session } }
          .to change(TutoringSession, :count).by(-1)
      end

      it 'redirects to tutoring_session :index view' do
        delete :destroy, params: { id: @tutoring_session }
        expect(response).to redirect_to tutoring_sessions_path
      end
    end
  end
end

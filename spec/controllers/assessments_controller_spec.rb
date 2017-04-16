require 'rails_helper'

RSpec.describe AssessmentsController, type: :controller do
  let(:valid_session) { {} }
  describe 'endpoints' do
    before do
      sign_in_auth
      @student = create(:student)
      @assessment = create(:assessment, student: @student)
      @assessment_attrs = attributes_for(:assessment)
      @assessment_attrs[:student_id] = @student.id
    end

    describe 'GET #index' do
      it 'populates an array of assessments' do
        get :index
        expect(assigns(:models)).to eq([@assessment])
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET #show' do
      it 'shows the specified assessment' do
        get :show, params: { id: @assessment }
        expect(assigns(:assessment)).to eq(@assessment)
      end

      it 'renders the :show view' do
        get :show, params: { id: @assessment }
        expect(response).to render_template('show')
      end
    end

    describe 'GET #new' do
      it 'creates a new assessment' do
        get :new
        expect(assigns(:assessment)).to be_a_new(Assessment)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template('new')
      end
    end

    describe 'GET #edit' do
      it 'modifies the specific assessment' do
        get :edit, params: { id: @assessment }
        expect(assigns(:assessment)).to eq(@assessment)
      end

      it 'render the :edit view' do
        get :edit, params: { id: @assessment }
        expect(response).to render_template('edit')
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'saves the new assessment to the database' do
          post :create, params: { assessment: @assessment_attrs },
                        session: valid_session
          expect(assigns(:assessment)).to be_persisted
        end

        it 'assigns newly created assessment as @assessment' do
          post :create, params: { assessment: @assessment_attrs },
                        session: valid_session
          expect(assigns(:assessment)).to be_a(Assessment)
        end

        it 'redirects to the newly created assessment view' do
          post :create, params: { assessment: @assessment_attrs },
                        session: valid_session
          expect(response).to redirect_to(Assessment.last)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Assessment).to receive(:save) { false }
        end

        it 'assigned a newly created but unsaved assessment as @assessment' do
          post :create, params: { assessment: @assessment_attrs },
                        session: valid_session
          expect(assigns(:assessment)).to be_a_new(Assessment)
        end

        it 're-renders the new assessment view' do
          post :create, params: { assessment: @assessment_attrs },
                        session: valid_session
          expect(response).to render_template :new
        end
      end
    end

    describe 'POST #update' do
      context 'with valid attributes' do
        it 'saves the updated assessment to the database' do
          post :update, params: { id: @assessment,
                                  assessment: @assessment_attrs }
          expect(Assessment.last).to eq(@assessment)
        end

        it 'assigns the updated assessment as @assessment' do
          post :update, params: { id: @assessment,
                                  assessment: @assessment_attrs }
          expect(assigns(:assessment)).to eq(@assessment)
        end

        it 'redirects to the assessment view' do
          post :update, params: { id: @assessment,
                                  assessment: @assessment_attrs }
          expect(response).to redirect_to(@assessment)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Assessment).to receive(:update) { false }
        end

        it 'assigns the existing assessment as @assessment' do
          post :update, params: { id: @assessment,
                                  assessment: @assessment_attrs }
          expect(assigns(:assessment)).to eq(@assessment)
        end

        it 're-renders the :edit view' do
          post :update, params: { id: @assessment,
                                  assessment: @assessment_attrs }
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the assessment' do
        expect { delete :destroy, params: { id: @assessment } }
          .to change(Assessment, :count).by(-1)
      end

      it 'redirects to assessment :index view' do
        delete :destroy, params: { id: @assessment }
        expect(response).to redirect_to assessments_path
      end
    end
  end
end

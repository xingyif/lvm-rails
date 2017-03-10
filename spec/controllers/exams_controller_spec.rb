require 'rails_helper'

RSpec.describe ExamsController, type: :controller do
  let(:valid_session) { {} }
  describe 'endpoints' do
    before do
      sign_in_auth
      @exam = create(:exam)
      @exam_attrs = attributes_for(:exam)
    end

    describe 'GET #index' do
      it 'populates an array of exams' do
        get :index
        expect(assigns(:exams)).to eq([@exam])
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET #show' do
      it 'shows the specified exam' do
        get :show, params: { id: @exam }
        expect(assigns(:exam)).to eq(@exam)
      end

      it 'renders the :show view' do
        get :show, params: { id: @exam }
        expect(response).to render_template('show')
      end
    end

    describe 'GET #new' do
      it 'creates a new exam' do
        get :new
        expect(assigns(:exam)).to be_a_new(Exam)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template('new')
      end
    end

    describe 'GET #edit' do
      it 'modifies the specific exam' do
        get :edit, params: { id: @exam }
        expect(assigns(:exam)).to eq(@exam)
      end

      it 'render the :edit view' do
        get :edit, params: { id: @exam }
        expect(response).to render_template('edit')
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'saves the new exam to the database' do
          post :create, params: { exam: @exam_attrs }, session: valid_session
          expect(assigns(:exam)).to be_persisted
        end

        it 'assigns newly created exam as @exam' do
          post :create, params: { exam: @exam_attrs }, session: valid_session
          expect(assigns(:exam)).to be_a(Exam)
        end

        it 'redirects to the newly created exam view' do
          post :create, params: { exam: @exam_attrs }, session: valid_session
          expect(response).to redirect_to(Exam.last)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Exam).to receive(:save) { false }
        end

        it 'assigned a newly created but unsaved exam as @exam' do
          post :create, params: { exam: @exam_attrs }, session: valid_session
          expect(assigns(:exam)).to be_a_new(Exam)
        end

        it 're-renders the new exam view' do
          post :create, params: { exam: @exam_attrs }, session: valid_session
          expect(response).to render_template :new
        end
      end
    end

    describe 'POST #update' do
      context 'with valid attributes' do
        it 'saves the updated exam to the database' do
          post :update, params: { id: @exam,
                                  exam: @exam_attrs }
          expect(Exam.last).to eq(@exam)
        end

        it 'assigns the updated exam as @exam' do
          post :update, params: { id: @exam,
                                  exam: @exam_attrs }
          expect(assigns(:exam)).to eq(@exam)
        end

        it 'redirects to the exam view' do
          post :update, params: { id: @exam,
                                  exam: @exam_attrs }
          expect(response).to redirect_to(@exam)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Exam).to receive(:update) { false }
        end

        it 'assigns the existing exam as @exam' do
          post :update, params: { id: @exam,
                                  exam: @exam_attrs }
          expect(assigns(:exam)).to eq(@exam)
        end

        it 're-renders the :edit view' do
          post :update, params: { id: @exam,
                                  exam: @exam_attrs }
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the exam' do
        expect { delete :destroy, params: { id: @exam } }
          .to change(Exam, :count).by(-1)
      end

      it 'redirects to exam :index view' do
        delete :destroy, params: { id: @exam }
        expect(response).to redirect_to exams_path
      end
    end
  end
end

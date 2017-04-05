require 'rails_helper'

RSpec.describe CoordinatorsController, type: :controller do
  describe 'endpoints' do
    before do
      sign_in_auth
    end

    describe 'GET #index' do
      before do
        @coordinator = create(:full_coordinator)
      end

      it 'populates the specified coordinator' do
        get :show, params: { id: @coordinator }
        expect(assigns(:coordinator)).to eq(@coordinator)
      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      before do
        @coordinator = create(:full_coordinator)
      end

      it 'populates the specified coordinator' do
        get :show, params: { id: @coordinator }
        expect(assigns(:coordinator)).to eq(@coordinator)
      end

      it "populates the specified coordinator's students" do
        get :show, params: { id: @coordinator }
        expect(assigns(:students)).to eq(@coordinator.students)
      end

      it "populates the specified coordinator's tutors" do
        get :show, params: { id: @coordinator }
        expect(assigns(:tutors)).to eq(@coordinator.tutors)
      end

      it 'renders the :show view' do
        get :show, params: { id: @coordinator }
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it 'populates a new coordinator' do
        get :new
        expect(assigns(:coordinator)).to be_a_new(Coordinator)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      before do
        @coordinator = create(:coordinator)
      end

      it 'populates the specified coordinator' do
        get :edit, params: { id: @coordinator }
        expect(assigns(:coordinator)).to eq(@coordinator)
      end

      it 'renders the :edit view' do
        get :edit, params: { id: @coordinator }
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
      before do
        @coordinator_attrs = attributes_for(:coordinator)
      end

      context 'with valid attributes' do
        it 'saves the new coordinator in the database' do
          post :create, params: { coordinator: @coordinator_attrs }
          expect(assigns(:coordinator)).to be_persisted
        end

        it 'assigns the newly created coordinator as @coordinator' do
          post :create, params: { coordinator: @coordinator_attrs }
          expect(assigns(:coordinator)).to be_a(Coordinator)
        end

        it 'redirects to the newly created coordinator view' do
          post :create, params: { coordinator: @coordinator_attrs }
          expect(response).to redirect_to(Coordinator.last)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Coordinator).to receive(:save) { false }
        end

        it 'assigns a newly created but unsaved purchase as @purchase' do
          post :create, params: { coordinator: @coordinator_attrs }
          expect(assigns(:coordinator)).to be_a_new(Coordinator)
        end

        it 're-renders the :new view' do
          post :create, params: { coordinator: @coordinator_attrs }
          expect(response).to render_template :new
        end
      end
    end

    describe 'PUT #update' do
      before do
        @coordinator = create(:coordinator)
        @new_coordinator_attrs = attributes_for(:coordinator)
      end

      context 'with valid attributes' do
        it 'saves the new coordinator in the database' do
          post :update, params: { id: @coordinator.id,
                                  coordinator: @new_coordinator_attrs }
          expect(Coordinator.last.first_name)
            .to eq(@new_coordinator_attrs[:first_name])
        end

        it 'assigns the updated coordinator as @coordinator' do
          post :update, params: { id: @coordinator.id,
                                  coordinator: @new_coordinator_attrs }
          expect(assigns(:coordinator).first_name)
            .to eq(@new_coordinator_attrs[:first_name])
        end

        it 'redirects to the coordinator view' do
          post :update, params: { id: @coordinator.id,
                                  coordinator: @new_coordinator_attrs }
          expect(response).to redirect_to(@coordinator)
        end
      end

      context 'with invalid attributes' do
        before do
          allow_any_instance_of(Coordinator).to receive(:update) { false }
        end

        it 'assigns the existing coordinator as @coordinator' do
          post :update, params: {
            id: @coordinator, coordinator: @new_coordinator_attrs
          }
          expect(assigns(:coordinator)).to eq(@coordinator)
        end

        it 're-renders the :edit view' do
          post :update, params: {
            id: @coordinator, coordinator: @new_coordinator_attrs
          }
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the coordinator' do
        coordinator = create(:coordinator)
        expect { delete :destroy, params: { id: coordinator } }
          .to change(Coordinator, :count).by(-1)
      end
      it 'redirects to the :index view' do
        coordinator = create(:coordinator)
        delete :destroy, params: { id: coordinator }
        expect(response).to redirect_to coordinators_path
      end
    end
  end
end

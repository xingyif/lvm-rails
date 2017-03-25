require 'rails_helper'

RSpec.describe AffiliatesController, type: :controller do
  describe 'as not admin' do
    it 'redirects to root path' do
      user = User.new(role: 1)
      sign_in_auth(user)
      get :index
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'as admin' do
    describe 'endpoints' do
      before do
        user = User.new(role: 2)
        sign_in_auth(user)
      end

      describe 'GET #index' do
        it 'populates an array of all affiliate' do
          affiliates = [create(:affiliate)]
          get :index
          expect(assigns(:affiliates)).to eq(affiliates)
        end

        it 'renders the :index view' do
          get :index
          expect(response).to render_template :index
        end
      end

      describe 'GET #show' do
        before do
          @affiliate = create(:affiliate)
        end

        it 'populates the specified affiliate' do
          get :show, params: { id: @affiliate }
          expect(assigns(:affiliate)).to eq(@affiliate)
        end

        it 'renders the :show view' do
          get :show, params: { id: @affiliate }
          expect(response).to render_template :show
        end
      end

      describe 'GET #new' do
        it 'populates a new affiliate' do
          get :new
          expect(assigns(:affiliate)).to be_a_new(Affiliate)
        end

        it 'renders the :new view' do
          get :new
          expect(response).to render_template :new
        end
      end

      describe 'GET #edit' do
        before do
          @affiliate = create(:affiliate)
        end
        it 'populates the specific student' do
          get :edit, params: { id: @affiliate }
          expect(assigns(:affiliate)).to eq(@affiliate)
        end

        it 'render the :edit view' do
          get :edit, params: { id: @affiliate }
          expect(response).to render_template :edit
        end
      end

      describe 'POST #create' do
        before do
          @affiliate_attrs = attributes_for(:affiliate)
        end

        context 'with valid attributes' do
          it 'saved the new affiliate in the database' do
            post :create, params: { affiliate: @affiliate_attrs }
            expect(assigns(:affiliate)).to be_persisted
          end

          it 'assigns the newly created affiliate as @affiliate' do
            post :create, params: { affiliate: @affiliate_attrs }
            expect(assigns(:affiliate)).to be_a(Affiliate)
          end

          it 'redirects to the newly created affiliate view' do
            post :create, params: { affiliate: @affiliate_attrs }
            expect(response).to redirect_to(Affiliate.last)
          end
        end

        context 'with invalid attributes' do
          before do
            allow_any_instance_of(Affiliate).to receive(:save) { false }
          end

          it 'assigns a newly created but unsaved affiliate as @affiliate' do
            post :create, params: { affiliate: @affiliate_attrs }
            expect(assigns(:affiliate)).to be_a_new(Affiliate)
          end

          it 're-renders the :new view' do
            post :create, params: { affiliate: @affiliate_attrs }
            expect(response).to render_template :new
          end
        end
      end

      describe 'PUT #update' do
        before do
          @affiliate = create(:affiliate)
          @new_affiliate_attrs = attributes_for(:affiliate)
        end

        context 'with valid attributes' do
          it 'saves the new affiliate in the database' do
            post :update, params: { id: @affiliate,
                                    affiliate: @new_affiliate_attrs }
            expect(Affiliate.last.name).to eq(@new_affiliate_attrs[:name])
          end

          it 'assigns the updated affiliate as @affiliate' do
            post :update, params: { id: @affiliate,
                                    affiliate: @new_affiliate_attrs }
            expect(assigns(:affiliate).name)
              .to eq(@new_affiliate_attrs[:name])
          end

          it 'redirects to the affiliate view' do
            post :update, params: { id: @affiliate,
                                    affiliate: @new_affiliate_attrs }
            expect(response).to redirect_to(@affiliate)
          end
        end

        context 'with invalid attributes' do
          before do
            allow_any_instance_of(Affiliate).to receive(:update) { false }
          end

          it 'assigns the existing affiliate as @affiliate' do
            post :update, params: { id: @affiliate,
                                    affiliate: @new_affiliate_attrs }
            expect(assigns(:affiliate)).to eq(@affiliate)
          end

          it 're-renders the :edit view' do
            post :update, params: { id: @affiliate,
                                    affiliate: @new_affiliate_attrs }
            expect(response).to render_template :edit
          end
        end
      end

      describe 'DELETE #destroy' do
        it 'destroys the affiliate' do
          affiliate = create(:affiliate)
          expect { delete :destroy, params: { id: affiliate } }
            .to change(Affiliate, :count).by(-1)
        end

        it 'redirects to the :index view' do
          affiliate = create(:affiliate)
          delete :destroy, params: { id: affiliate }
          expect(response).to redirect_to affiliates_path
        end
      end
    end
  end
end

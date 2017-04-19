require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'as not coordinator' do
    it 'redirects to root path' do
      user = User.new(role: 0)
      sign_in_auth(user)
      get :index
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'as coordinator' do
    describe 'endpoints' do
      before do
        user = User.new(role: 2)
        sign_in_auth(user)
      end

      describe 'GET #index' do
        it 'populates an array of all tags' do
          tags = [create(:tag)]
          get :index
          expect(assigns(:models)).to eq(tags)
        end

        it 'renders the :index view' do
          get :index
          expect(response).to render_template :index
        end
      end

      describe 'GET #show' do
        before do
          @tag = create(:tag)
          @student = create(:student)
          @tutor = create(:tutor)
          Tagging.create(tag_id: @tag.id, student_id: @student.id)
          Tagging.create(tag_id: @tag.id, tutor_id: @tutor.id)
        end

        it 'populates the tag, tutors, and students tagged' do
          get :show, params: { id: @tag }, format: :js, xhr: true
          expect(assigns(:tag)).to eq(@tag)
          expect(assigns(:tagged_students)).to eq([@student])
          expect(assigns(:tagged_tutors)).to eq([@tutor])
        end
      end

      describe 'GET #edit' do
        before do
          @tag = create(:tag)
        end

        it 'populates the specified tutor' do
          get :edit, params: { id: @tag }, format: :js, xhr: true
          expect(assigns(:tag)).to eq(@tag)
        end
      end

      describe 'PUT #update' do
        before do
          @tag = create(:tag)
          @new_tag_attrs = attributes_for(:tag)
        end

        context 'with valid attributes' do
          it 'saves the updated tag in the database' do
            post :update, params: { id: @tag.id, tag: @new_tag_attrs }
            expect(Tag.last.name).to eq(@new_tag_attrs[:name])
          end

          it 'redirects to the tags index view' do
            post :update, params: { id: @tag.id, tag: @new_tag_attrs }
            expect(response).to redirect_to(tags_path)
          end
        end

        context 'with invalid attributes' do
          before do
            allow_any_instance_of(Tag).to receive(:update) { false }
          end

          it 'assigns the existing tutor as @tag' do
            post :update, params: { id: @tag, tag: @new_tag_attrs }
            expect(assigns(:tutor)).to eq(@tutor)
          end

          it 're-renders the :edit view' do
            post :update, params: { id: @tag, tag: @new_tag_attrs }
            expect(response).to redirect_to tags_path
          end
        end
      end

      describe 'DELETE #destroy' do
        it 'destroys the tag' do
          tag = create(:tag)
          expect { delete :destroy, params: { id: tag } }
            .to change(Tag, :count).by(-1)
        end

        it 'destroys any created taggings' do
          tag = create(:tag)
          Tagging.create(tag_id: tag.id)
          expect { delete :destroy, params: { id: tag } }
            .to change(Tagging, :count).by(-1)
        end

        it 'redirects to the :index view' do
          tag = create(:tag)
          delete :destroy, params: { id: tag }
          expect(response).to redirect_to tags_path
        end
      end

      describe 'POST #create' do
        before do
          @tag_attrs = attributes_for(:tag)
        end

        context 'with valid attributes' do
          it 'saves the new tag in the database' do
            post :create, params: { tag: @tag_attrs }
            expect(assigns(:tag)).to be_persisted
          end

          it 'assigns the newly created tag as @tag' do
            post :create, params: { tag: @tag_attrs }
            expect(assigns(:tag)).to be_a(Tag)
          end

          it 'renders the tag as json from an ajax request' do
            post :create,
                 params: { tag: @tag_attrs.merge(name: 'blah') },
                 format: :json

            expect(response.header['Content-Type'])
              .to include 'application/json'
            expect(JSON.parse(response.body)['name']).to eq 'blah'
          end

          it 'redirects to the tags#index page from html request' do
            post :create, params: { tag: @tag_attrs }
            expect(response).to redirect_to(tags_path)
          end
        end

        context 'with invalid attributes' do
          before do
            allow_any_instance_of(Tag).to receive(:save) { false }
          end

          it 'assigns a newly created but unsaved tag as @tag' do
            post :create, params: { tag: @tag_attrs }
            expect(assigns(:tag)).to be_a_new(Tag)
          end
        end
      end
    end
  end
end

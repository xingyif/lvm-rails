require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'endpoints' do
    before do
      sign_in_auth
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

        it 'renders the tag as json' do
          post :create, params: { tag: @tag_attrs.merge(name: 'blah') }
          expect(response.header['Content-Type']).to include 'application/json'
          expect(JSON.parse(response.body)['name']).to eq 'blah'
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

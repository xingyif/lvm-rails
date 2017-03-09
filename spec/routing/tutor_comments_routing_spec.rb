require 'rails_helper'

RSpec.describe TutorCommentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tutor_comments').to route_to('tutor_comments#index')
    end

    it 'routes to #new' do
      expect(get: '/tutor_comments/new').to route_to('tutor_comments#new')
    end

    it 'routes to #show' do
      expect(get: '/tutor_comments/1')
        .to route_to('tutor_comments#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/tutor_comments/1/edit')
        .to route_to('tutor_comments#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tutor_comments').to route_to('tutor_comments#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tutor_comments/1')
        .to route_to('tutor_comments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tutor_comments/1')
        .to route_to('tutor_comments#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tutor_comments/1')
        .to route_to('tutor_comments#destroy', id: '1')
    end
  end
end

require 'rails_helper'

RSpec.describe TagsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/tags').to route_to('tags#create')
    end
  end
end

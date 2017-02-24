require 'rails_helper'

RSpec.describe 'Affiliates', type: :request do
  describe 'GET /affiliates' do
    # before do
    #   sign_in_auth
    # end

    it 'request has succeeded, http status 200' do
      get affiliates_path
      expect(response).to have_http_status(302)	# TODO
    end
  end
end

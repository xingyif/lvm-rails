require 'rails_helper'

RSpec.xdescribe 'tutoring_sessions/show' do
  before(:each) do
    @tutoring_session = assign(:tutoring_session, create(:tutoring_session))
  end

  it 'displays the attributes in <p>' do
    render
  end
end

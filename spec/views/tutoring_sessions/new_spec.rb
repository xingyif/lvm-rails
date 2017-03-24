require 'rails_helper'

RSpec.xdescribe 'tutoring_sessions/new', type: :view do
  before(:each) do
    assign(:tutoring_session, Coordinator.new)
  end

  it 'should renders the new form' do
    render

    assert_select 'form[action=?][method=?]', tutoring_sessions_path, 'post' do
    end
  end
end

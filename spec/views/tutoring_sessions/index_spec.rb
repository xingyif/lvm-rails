require 'rails_helper'

RSpec.xdescribe 'tutoring_sessions/index', type: :view do
  before(:each) do
    @tutoring_session = create(:tutoring_session)
    assign(:tutoring_sessions, [@tutoring_session])
  end

  it 'renders a list of tutoring_sessions' do
    render
    expect(rendered).to match(@tutoring_session.location)
    expect(rendered).to match(@tutoring_session.start_time)
    expect(rendered).to match(@tutoring_session.end_time)
  end
end

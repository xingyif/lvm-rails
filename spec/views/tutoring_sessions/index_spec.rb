require 'rails_helper'

RSpec.describe 'tutoring_sessions/index', type: :view do
  before(:each) do
    @tutoring_session = create(:tutoring_session)
    assign(:tutoring_sessions, [@tutoring_session])
  end

  it 'renders a list of tutoring_sessions' do
    render
    expect(rendered).to match(@tutoring_session.location)
    expect(rendered).to match(@tutoring_session.hours.to_s)
    expect(rendered).to match(@tutoring_session.start_date.strftime('%Y-%m-%d'))
    expect(rendered).to match(@tutoring_session.end_date.strftime('%Y-%m-%d'))
    expect(rendered).to match(@tutoring_session.session_comment.to_s)
  end
end

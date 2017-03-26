require 'rails_helper'

RSpec.describe 'tutoring_sessions/index', type: :view do
  before(:each) do
    @tutoring_session = create(:tutoring_session, location: 'library',
                               start_time: '2017-03-03',
                               end_time: '2017-03-03')
    assign(:tutoring_sessions, [@tutoring_session])
  end

  it 'renders a list of tutoring_sessions' do
    render
    expect(rendered).to match(/library/)
    expect(rendered).to match(/2017-03-03/)
    expect(rendered).to match(/2017-03-03/)
  end
end

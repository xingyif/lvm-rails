require 'rails_helper'

RSpec.describe 'tutoring_sessions/edit', type: :view do
  before(:each) do
    @tutoring_session = create(:tutoring_session)
  end

  it 'renders the edit tutoring_session form' do
    render

    expect(rendered).to match(/location/)
    expect(rendered).to match(/start_time/)
    expect(rendered).to match(/end_time/)
  end
end

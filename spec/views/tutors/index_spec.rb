require 'rails_helper'

RSpec.describe 'tutors/index', type: :view do
  before(:each) do
    @tutor = create(:tutor, cell_phone: '(999) 999-9999',
                            home_phone: '(888) 888-8888')
    assign(:tutors, [@tutor])
  end

  it 'renders a list of tutors' do
    render
    expect(rendered).to match(@tutor.first_name)
    expect(rendered).to match(@tutor.last_name)
    expect(rendered).to match(/\(999\) 999-9999/)
    expect(rendered).to match(/\(888\) 888-8888/)
    expect(rendered).to match(@tutor.email_preferred)
  end
end

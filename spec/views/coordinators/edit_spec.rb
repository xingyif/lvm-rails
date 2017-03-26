require 'rails_helper'

RSpec.describe 'coordinators/edit', type: :view do
  before(:each) do
    @coordinator = create(:coordinator, phone_number: '(999) 999-9999')
  end

  it 'renders the edit coordinator form' do
    render

    expect(rendered).to match(@coordinator.name)
    expect(rendered).to match(@coordinator.date_of_birth.strftime('%Y-%m-%d'))
    expect(rendered).to match(@coordinator.email)
    expect(rendered).to match(/\(999\) 999-9999/)
  end
end

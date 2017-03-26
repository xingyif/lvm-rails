require 'rails_helper'

RSpec.describe 'coordinators/index', type: :view do
  before(:each) do
    @coordinator = create(:coordinator, phone_number: '(999) 999-9999')
    @coordinator2 = create(:coordinator, phone_number: '(999) 999-9999')
    assign(:coordinators, [@coordinator, @coordinator2])
  end

  it 'renders a list of coordinators' do
    render
    expect(rendered).to match(@coordinator.name)
    expect(rendered).to match(@coordinator2.name)
  end
end

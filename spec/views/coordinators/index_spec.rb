require 'rails_helper'

RSpec.describe 'coordinators/index', type: :view do
  before(:each) do
    @coordinator = create(:coordinator)
    @coordinator2 = create(:coordinator)
    assign(:coordinators, [@coordinator, @coordinator2])
  end

  it 'renders a list of coordinators' do
    render
    expect(rendered).to match(@coordinator.first_name)
    expect(rendered).to match(@coordinator2.first_name)
  end
end

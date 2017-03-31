require 'rails_helper'
require 'spec_helper'

RSpec.describe 'coordinators/show', type: :view do
  before(:each) do
    @coordinator = create(:coordinator, phone_number: '(999) 999-9999')
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@coordinator.name)
    expect(rendered).to match(/\(999\) 999-9999/)
    expect(rendered).to match(@coordinator.email)
  end

  it 'contains the Back link' do
    render
    assert_select 'a[href=?]', coordinators_path
  end

  it 'contains the Edit link' do
    render
    assert_select 'a[href=?]', edit_coordinator_path(@coordinator)
  end
end

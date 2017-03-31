require 'rails_helper'
require 'spec_helper'

RSpec.describe 'affiliates/show', type: :view do
  before(:each) do
    @affiliate = create(:affiliate, phone_number: '(999) 999-9999')
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@affiliate.name)
    expect(rendered).to match(/\(999\) 999-9999/)
    expect(rendered).to match(@affiliate.state)
    expect(rendered).to match(@affiliate.city)
    expect(rendered).to match(@affiliate.zip)
    expect(rendered).to match(@affiliate.email)
    expect(rendered).to match(@affiliate.address)
  end

  it 'contains the Back link' do
    render
    assert_select 'a[href=?]', affiliates_path
  end

  it 'contains the Edit link' do
    render
    assert_select 'a[href=?]', edit_affiliate_path(@affiliate)
  end
end

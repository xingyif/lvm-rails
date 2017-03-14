require 'rails_helper'
require 'spec_helper'

RSpec.describe 'affiliates/show', type: :view do
  before(:each) do
    @affiliate = assign(:affiliate, Affiliate.create!(
                                      name: 'Name',
                                      address: 'Address',
                                      phone_number: 'PhoneNumber',
                                      email: 'Email@g.com',
                                      website: 'Website',
                                      twitter: 'Twitter'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/PhoneNumber/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Twitter/)
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

require 'rails_helper'

RSpec.describe 'affiliates/edit', type: :view do
  before(:each) do
    @affiliate = create(:affiliate, phone_number: '(999) 999-9999')
  end

  it 'renders the edit affiliate form' do
    render

    expect(rendered).to match(@affiliate.name)
    expect(rendered).to match(@affiliate.email)
    expect(rendered).to match(/\(999\) 999-9999/)
    expect(rendered).to match(@affiliate.address)
  end
end

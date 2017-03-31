require 'rails_helper'

RSpec.describe 'affiliates/index', type: :view do
  before(:each) do
    @affiliate = create(:affiliate, phone_number: '(999) 999-9999')
    @affiliate2 = create(:affiliate, phone_number: '(999) 999-9999')
    assign(:affiliates, [@affiliate, @affiliate2])
  end

  it 'renders a list of affiliates' do
    render
    expect(rendered).to match(@affiliate.name)
    expect(rendered).to match(@affiliate2.name)
  end
end

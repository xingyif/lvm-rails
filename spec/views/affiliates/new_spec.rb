require 'rails_helper'

RSpec.describe 'affiliates/new', type: :view do
  before(:each) do
    assign(:affiliate, Affiliate.new)
  end

  it 'should renders the new form' do
    render

    assert_select 'form[action=?][method=?]', affiliates_path, 'post' do
    end
  end
end

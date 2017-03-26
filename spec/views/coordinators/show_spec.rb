require 'rails_helper'

RSpec.describe 'coordinators/show' do
  before(:each) do
    @coordinator = assign(:coordinator, create(:coordinator))
  end

  it 'displays the attributes in <p>' do
    render
  end
end

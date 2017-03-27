require 'rails_helper'

RSpec.describe 'assessments/show' do
  before(:each) do
    @assessment = assign(:assessment, create(:assessment))
  end

  it 'displays the attributes in <p>' do
    render
  end
end

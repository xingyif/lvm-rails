require 'rails_helper'

RSpec.describe 'exams/show' do
  before(:each) do
    @exam = assign(:exam, create(:exam))
  end

  it 'displays the attributes in <p>' do
    render
  end
end

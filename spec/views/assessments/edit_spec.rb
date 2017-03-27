require 'rails_helper'

RSpec.describe 'assessments/edit', type: :view do
  before(:each) do
    @assessment = assign(:assessment, Assessment.create!(
                                        score: '97',
                                        date: '2017-03-02',
                                        subject: 'English'
    ))
  end

  it 'renders the edit assessment form' do
    render

    expect(rendered).to match(/score/)
    expect(rendered).to match(/date/)
    expect(rendered).to match(/subject/)
  end
end

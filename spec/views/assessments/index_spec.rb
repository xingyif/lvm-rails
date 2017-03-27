require 'rails_helper'

RSpec.describe 'assessments/index', type: :view do
  before(:each) do
    @assessment = assign(:assessments,
                         [Assessment.create!(score: '97',
                                             date: '2017-03-02',
                                             subject: 'English'),
                          Assessment.create!(score: '92',
                                             date: '2017-03-03',
                                             subject: 'English')])
  end

  it 'renders a list of assessments' do
    render
    expect(rendered).to match(/97/)
    expect(rendered).to match(/2017-03-02/)
    expect(rendered).to match(/English/)
    expect(rendered).to match(/92/)
    expect(rendered).to match(/2017-03-03/)
    expect(rendered).to match(/English/)
  end
end

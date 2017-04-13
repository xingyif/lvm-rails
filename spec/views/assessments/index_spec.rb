require 'rails_helper'

RSpec.describe 'assessments/index', type: :view do
  before(:each) do
    @assessment = create(:assessment, name: 'TABE 10',
                                      assessment_type: 'Does not apply',
                                      student: create(:student))
    @assessment2 = create(:assessment, name: 'TABE 9',
                                       assessment_type: 'Does not apply',
                                       student: create(:student))
    assign(:assessments, [@assessment, @assessment2])
  end

  it 'renders a list of assessments' do
    render
    expect(rendered).to match(@assessment.score)
    expect(rendered).to match(@assessment.date.strftime('%Y-%m-%d'))
    expect(rendered).to match(@assessment.category)
    expect(rendered).to match(@assessment.level)
    expect(rendered).to match(@assessment.name)
    expect(rendered).to match(@assessment.assessment_type)
    expect(rendered).to match(@assessment2.score)
    expect(rendered).to match(@assessment2.date.strftime('%Y-%m-%d'))
    expect(rendered).to match(@assessment2.category)
    expect(rendered).to match(@assessment2.level)
    expect(rendered).to match(@assessment2.name)
    expect(rendered).to match(@assessment2.assessment_type)
  end
end

require 'rails_helper'

RSpec.describe 'assessments/show' do
  before(:each) do
    @assessment = create(:assessment, name: 'MAPT',
                                      assessment_type: 'Does not apply',
                                      student: create(:student))
  end

  it 'displays the attributes in <p>' do
    render
    expect(rendered).to match(@assessment.score)
    expect(rendered).to match(@assessment.date.strftime('%Y-%m-%d'))
    expect(rendered).to match(@assessment.category)
    expect(rendered).to match(@assessment.level)
    expect(rendered).to match(@assessment.name)
    expect(rendered).to match(@assessment.student_id.to_s)
    expect(rendered).to match(@assessment.assessment_type)
  end
end

require 'rails_helper'

RSpec.describe 'exams/index', type: :view do
  before(:each) do
    @exam = assign(:exams, [Exam.create!(score: '97',
                                         exam_date: '2017-03-02',
                                         subject: 'English'),
                            Exam.create!(score: '92',
                                         exam_date: '2017-03-03',
                                         subject: 'English')])
  end

  it 'renders a list of exams' do
    render
    expect(rendered).to match(/97/)
    expect(rendered).to match(/2017-03-02/)
    expect(rendered).to match(/English/)
    expect(rendered).to match(/92/)
    expect(rendered).to match(/2017-03-03/)
    expect(rendered).to match(/English/)
  end
end

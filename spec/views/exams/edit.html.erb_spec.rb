require 'rails_helper'

RSpec.describe 'exams/edit', type: :view do
  before(:each) do
    @exam = assign(:exam, Exam.create!(
                            score: '97',
                            exam_date: '2017-03-02',
                            subject: 'English'
    ))
  end

  it 'renders the edit exam form' do
    render

    expect(rendered).to match(/score/)
    expect(rendered).to match(/exam_date/)
    expect(rendered).to match(/subject/)
  end
end

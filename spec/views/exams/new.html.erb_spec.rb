require 'rails_helper'

RSpec.describe 'exams/new', type: :view do
  before(:each) do
    assign(:exam, Exam.new)
  end

  it 'should renders the new form' do
    render

    assert_select 'form[action=?][method=?]', exams_path, 'post' do
    end
  end
end

require 'rails_helper'

RSpec.describe 'tutors/index', type: :view do
  before(:each) do
    @tutor1 = create(:tutor)
    @tutor2 = create(:tutor)
    assign(:tutors, [@tutor1, @tutor2])
  end

  it 'renders a list of tutors' do
    render
    expect(rendered).to match(@tutor1.first_name)
    expect(rendered).to match(@tutor2.first_name)
  end
end

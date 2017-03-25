require 'rails_helper'

RSpec.describe 'students/index.html.erb', type: :view do
  describe 'populate page and links' do
    before do
      assign(:can_edit, true)
      @students = [create(:student, first_name: 'Joe', last_name: 'Lally',
                                    gender: 'male'),
                   create(:student, first_name: 'Tim', last_name: 'Bradley',
                                    gender: 'male')]
      render
    end

    describe 'title' do
      it 'checks for title' do
        expect(rendered).to match(/Students/)
      end
    end

    describe 'student list' do
      it 'shows the first student' do
        expect(rendered).to match(/Joe/)
      end

      it 'shows the second student' do
        expect(rendered).to match(/Tim/)
      end
    end
  end
end

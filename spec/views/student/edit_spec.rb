require 'rails_helper'

RSpec.describe 'students/edit.html.erb', type: :view do
  describe 'populate page' do
    before do
      @student = Student.create(first_name: 'Joe',
                                last_name: 'Lally')
      render
    end

    describe 'presence of title' do
      it 'checks for title' do
        expect(rendered).to match(/Editing student/)
      end
    end

    describe 'presence of name label' do
      it 'checks for name label' do
        expect(rendered).to match(/First name/)
      end
    end

    describe 'presence of students' do
      it 'checks for students name' do
        expect(rendered).to match(/Joe/)
      end
    end

    describe 'links' do
      it 'checks for link back' do
        assert_select 'a[href=?]', students_path
      end
    end

    describe 'save button' do
      it 'checks for presence of save button' do
        expect(rendered).to have_button('Save Student')
      end
    end

    xdescribe 'click links' do
      it 'checks for link path after clicking' do
        visit edit_student_path(@student)
        current_path.should eq(edit_student_path(@student))
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'students/new.html.erb', type: :view do
  describe 'populate page' do
    before do
      @student = Student.create(first_name: 'Joe',
                                last_name: 'Lally',
                                gender: 'male')
      render
    end

    describe 'presence of name label' do
      it 'checks for name label' do
        expect(rendered).to match(/First name/)
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

    describe 'name text entry field' do
      it 'checks for presence of empty text field for name' do
        expect(rendered).to have_field('student_first_name', text: nil)
      end
    end

    xdescribe 'name text entry field filled' do
      it 'checks for presence of filled in text field' do
        fill_in 'student_name', with: 'JoeJoe'
        expect(rendered).to have_field('student_name', text: 'JoeJoe')
      end
    end
  end
end

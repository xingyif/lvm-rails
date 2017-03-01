require 'rails_helper'

RSpec.describe 'students/index.html.erb', type: :view do
  describe 'populate page and links' do
    before do
      @students = [Student.create(first_name: 'Joe',
                                  last_name: 'Lally'),
                   Student.create(first_name: 'Tim',
                                  last_name: 'Bradley'),
                   Student.create(first_name: 'Rex',
                                  last_name: 'Ryan'),
                   Student.create(first_name: 'Rob',
                                  last_name: 'Gronk')]
      render
    end

    describe 'title' do
      it 'checks for title' do
        expect(rendered).to match(/Students/)
      end
    end

    describe 'presence of students' do
      it 'checks forfirst student name' do
        expect(rendered).to match(/Joe Lally/)
      end

      it 'checks for second student name' do
        expect(rendered).to match(/Tim Bradley/)
      end

      it 'checks for third student name' do
        expect(rendered).to match(/Rex Ryan/)
      end

      it 'checks for fourth student name' do
        expect(rendered).to match(/Rob Gronk/)
      end
    end

    describe 'links' do
      it 'checks for links edit' do
        assert_select 'a[href=?]', edit_student_path(@students[0])
        assert_select 'a[href=?]', edit_student_path(@students[1])
        assert_select 'a[href=?]', edit_student_path(@students[2])
        assert_select 'a[href=?]', edit_student_path(@students[3])
      end

      it 'checks for show links' do
        assert_select 'a[href=?]', students_path + '/1'
        assert_select 'a[href=?]', students_path + '/2'
        assert_select 'a[href=?]', students_path + '/3'
        assert_select 'a[href=?]', students_path + '/4'
      end

      it 'checks for back link' do
        assert_select 'a[href=?]', root_path
      end
    end
  end
end

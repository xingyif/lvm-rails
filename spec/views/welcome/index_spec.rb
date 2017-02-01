require 'rails_helper'

RSpec.describe 'welcome/index.html.erb', type: :view do
  describe 'links' do
    before do
      render
    end

    describe 'student views' do
      it 'provides a link to the index page' do
        assert_select 'a[href=?]', new_student_path
      end

      it 'provides a link to the new page' do
        assert_select 'a[href=?]', students_path
      end
    end

    describe 'tutor views' do
      it 'provides a link to the index page' do
        assert_select 'a[href=?]', new_tutor_path
      end

      it 'provides a link to the new page' do
        assert_select 'a[href=?]', tutors_path
      end
    end

    describe 'coordinator views' do
      it 'provides a link to the index page' do
        assert_select 'a[href=?]', new_coordinator_path
      end

      it 'provides a link to the new page' do
        assert_select 'a[href=?]', coordinators_path
      end
    end
  end
end

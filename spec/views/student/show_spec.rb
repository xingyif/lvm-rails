require 'rails_helper'

RSpec.describe 'students/show.html.erb', type: :view do
  describe 'populate page and links' do
    before do
      @coordinator = create(:coordinator)
      @tutors = [Tutor.create(first_name: 'Bob', last_name: 'Smith'),
                 Tutor.create(first_name: 'Tom', last_name: 'Brady')]
      @students = [Student.create(first_name: 'Mike', last_name: 'White',
                                  gender: 'male'),
                   Student.create(first_name: 'Alex', last_name: 'Fallah',
                                  gender: 'female')]
      render
    end

    xdescribe 'presence of coordinators' do
      it 'checks for both coordinators names' do
        expect(rendered).to match(@coordinator.name)
      end

      it 'checks for both coordinators emails' do
        expect(rendered).to match(@coordinator.email)
      end
    end

    xdescribe 'presence of tutors' do
      it 'checks for both tutors names' do
        expect(rendered).to match(/Bob Smith/)
        expect(rendered).to match(/Tom Brady/)
      end
    end

    xdescribe 'presence of students' do
      it 'checks for both students names' do
        expect(rendered).to match(/Mike White/)
        expect(rendered).to match(/Alex Fallah/)
      end
    end

    xdescribe 'links' do
      it 'checks for links edit and back' do
        assert_select 'a[href=?]', edit_coordinator_path(@coordinator)
        assert_select 'a[href=?]', coordinators_path
      end
    end

    xdescribe 'click links' do
      it 'checks for link path after clicking' do
        visit edit_coordinator_path(@coordinator)
        current_path.should eq(edit_coordinator_path(@coordinator))
      end
    end
  end
end

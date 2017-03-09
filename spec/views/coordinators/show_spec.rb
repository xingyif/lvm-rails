# spec/views/products/show.html.erb_spec.rb

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'coordinators/show.html.erb', type: :view do
  describe 'populate page and links' do
    before do
      @coordinator = Coordinator.create(name: 'Joe Lally',
                                        email: 'email@email.com')
      @tutors = [Tutor.create(first_name: 'Bob', last_name: 'Smith'),
                 Tutor.create(first_name: 'Tom', last_name: 'Brady')]
      @students = [Student.create(first_name: 'Mike', last_name: 'White'),
                   Student.create(first_name: 'Alex', last_name: 'Fallah')]
      render
    end

    describe 'presence of coordinators' do
      it 'checks for both coordinators names' do
        expect(rendered).to match(/Joe Lally/)
      end

      it 'checks for both coordinators emails' do
        expect(rendered).to match(/email@email.com/)
      end
    end

    describe 'presence of tutors' do
      it 'checks for both tutors names' do
        expect(rendered).to match(/Bob Smith/)
        expect(rendered).to match(/Tom Brady/)
      end
    end

    describe 'presence of students' do
      it 'checks for both students names' do
        expect(rendered).to match(/Mike White/)
        expect(rendered).to match(/Alex Fallah/)
      end
    end

    describe 'links' do
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

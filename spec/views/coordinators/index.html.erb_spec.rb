require 'rails_helper'
require 'spec_helper'

RSpec.describe 'coordinators/index.html.erb', type: :view do
  describe 'populate page and links' do
    before do
      @coordinators = [Coordinator.create(name: 'Joe Lally',
                                          email: 'email@email.com'),
                       Coordinator.create(name: 'Tom Smith',
                                          email: 'tom@yahoo.com'),
                       Coordinator.create(name: 'John Doe',
                                          email: 'john@gmail.com'),
                       Coordinator.create(name: 'Jane White',
                                          email: 'jane@email.com')]
      render
    end

    describe 'title' do
      it 'checks for title' do
        expect(rendered).to match(/Coordinators/)
      end
    end

    describe 'presence of coordinators' do
      it 'checks for first coordinator name' do
        expect(rendered).to match(/Joe Lally/)
      end

      it 'checks for second coordinator name' do
        expect(rendered).to match(/Tom Smith/)
      end

      it 'checks for third coordinator name' do
        expect(rendered).to match(/John Doe/)
      end

      it 'checks for fourth coordinator name' do
        expect(rendered).to match(/Jane White/)
      end
    end

    describe 'links' do
      it 'checks for links edit' do
        assert_select 'a[href=?]', edit_coordinator_path(@coordinators[0])
        assert_select 'a[href=?]', edit_coordinator_path(@coordinators[1])
        assert_select 'a[href=?]', edit_coordinator_path(@coordinators[2])
        assert_select 'a[href=?]', edit_coordinator_path(@coordinators[3])
      end

      it 'checks for show links' do
        assert_select 'a[href=?]', coordinators_path + '/1'
        assert_select 'a[href=?]', coordinators_path + '/2'
        assert_select 'a[href=?]', coordinators_path + '/3'
        assert_select 'a[href=?]', coordinators_path + '/4'
      end

      it 'checks for back link' do
        assert_select 'a[href=?]', root_path
      end
    end
  end
end

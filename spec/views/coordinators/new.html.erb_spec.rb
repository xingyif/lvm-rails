# spec/views/products/show.html.erb_spec.rb

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'coordinators/new.html.erb', type: :view do
  describe 'populate page' do
    before do
      @coordinator = Coordinator.create(name: 'Joe Lally',
                                        email: 'email@email.com')
      render
    end

    describe 'presence of name label' do
      it 'checks for name label' do
        expect(rendered).to match(/Name/)
      end
    end

    describe 'presence of email label' do
      it 'checks for email label' do
        expect(rendered).to match(/Email/)
      end
    end

    describe 'links' do
      it 'checks for link back' do
        assert_select 'a[href=?]', coordinators_path
      end
    end

    describe 'save button' do
      it 'checks for presence of save button' do
        expect(rendered).to have_button('Save')
      end
    end

    describe 'name text entry field' do
      it 'checks for presence of empty text field for name' do
        expect(rendered).to have_field('coordinator_name', text: nil)
      end
    end

    xdescribe 'name text entry field filled' do
      it 'checks for presence of filled in text field' do
        visit new_coordinator_path
        fill_in 'coordinator_name', with: 'JoeJoe'
        expect(rendered).to have_field('coordinator_name', text: 'JoeJoe')
      end
    end

    describe 'email text entry field' do
      it 'checks for presence of empty text field for email' do
        expect(rendered).to have_field('coordinator_email', text: nil)
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

# spec/views/products/show.html.erb_spec.rb

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'coordinators/edit.html.erb', type: :view do
  describe 'populate page' do
    before do
      @coordinator = Coordinator.create(name: 'Joe Lally',
                                        email: 'email@email.com')
      render
    end

    describe 'presence of title' do
      it 'checks for title' do
        expect(rendered).to match(/Editing coordinator/)
      end
    end

    describe 'presence of name label' do
      it 'checks for name label' do
        expect(rendered).to match(/Name/)
      end
    end

    describe 'presence of coordinators' do
      it 'checks for coordinators name' do
        expect(rendered).to match(/Joe Lally/)
      end
    end

    describe 'presence of email label' do
      it 'checks for email label' do
        expect(rendered).to match(/Email/)
      end
    end

    describe 'presence of email' do
      it 'checks for coordinators email' do
        expect(rendered).to match(/email@email.com/)
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

    xdescribe 'click links' do
      it 'checks for link path after clicking' do
        visit edit_coordinator_path(@coordinator)
        current_path.should eq(edit_coordinator_path(@coordinator))
      end
    end
  end
end

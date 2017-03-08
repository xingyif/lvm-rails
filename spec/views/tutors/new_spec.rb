require 'rails_helper'

RSpec.describe 'tutors/new', type: :view do
  describe 'render' do
    before do
      @tutor = Tutor.new
    end

    it 'renders the form partial' do
      # Helpful for letting you know if you accidentally killed it
      render

      expect(rendered).to match(/First name/)
    end
  end
end

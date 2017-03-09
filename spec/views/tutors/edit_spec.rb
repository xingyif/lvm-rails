require 'rails_helper'

RSpec.describe 'tutors/edit', type: :view do
  describe 'render' do
    before do
      @tutor = create(:tutor)
    end

    it 'renders the form partial' do
      # Helpful for letting you know if you accidentally killed it
      render

      expect(rendered).to match(/First name/)
    end
  end
end

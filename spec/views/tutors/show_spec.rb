require 'rails_helper'
require 'spec_helper'

RSpec.describe 'tutors/show.html.erb', type: :view do
  describe 'language proficiencies' do
    before do
      @students = []
      @student_options = []
    end

    context 'with no language proficiencies' do
      before do
        @tutor = create(:tutor)
      end

      it 'renders the correct string' do
        render
        expect(rendered).to match(/No language proficiency data on file./)
      end
    end

    context 'with some language proficiencies' do
      before do
        proficiencies = { English: 'Native' }.to_json
        @tutor = create(:tutor, language_proficiencies: proficiencies)
      end

      it 'renders the proficiencies correctly' do
        render
        expect(rendered).to match(/English/)
        expect(rendered).to match(/Native/)
      end
    end
  end
end

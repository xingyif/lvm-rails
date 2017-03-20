require 'rails_helper'
require 'spec_helper'

RSpec.describe 'tutors/show.html.erb', type: :view do
  before do
    @students = []
    @student_options = []
  end

  describe 'language proficiencies' do
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

  describe 'tags' do
    before do
      @tutor = create(:tutor)
    end

    context 'with no tags' do
      it 'renders the correct string' do
        render
        expect(rendered).to match(/No tags added./)
      end
    end

    context 'with some tags' do
      before do
        @tag1 = Tag.create(name: 'testing tags')
        @tag2 = Tag.create(name: 'one two three')
        Tagging.create(tag_id: @tag1.id, tutor_id: @tutor.id)
        Tagging.create(tag_id: @tag2.id, tutor_id: @tutor.id)
      end

      it 'renders the tags correctly' do
        render
        expect(rendered).to match(/testing tags/)
        expect(rendered).to match(/one two three/)
      end
    end
  end
end

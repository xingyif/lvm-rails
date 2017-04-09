require 'rails_helper'

RSpec.describe 'matches/index.html.erb', type: :view do
  describe 'match table' do
    before do
      a1 = create(:affiliate)

      @s1 = create(:student, id: 1)
      @s2 = create(:student, id: 2)
      @t1 = create(:tutor, id: 1)
      @t2 = create(:tutor, id: 2)

      create(:volunteer_job, tutor: @t1, affiliate: a1)
      create(:volunteer_job, tutor: @t2, affiliate: a1)

      create(:enrollment, student: @s1, affiliate: a1)
      create(:enrollment, student: @s2, affiliate: a1)

      m1 = create(:match, student: @s1, tutor: @t1)
      m2 = create(:match, student: @s2, tutor: @t2)

      assign(:matches, [m1, m2])

      render
    end

    it 'renders all matches' do
      expect(rendered).to match(@s1.first_name)
      expect(rendered).to match(@s2.first_name)
      expect(rendered).to match(@t1.first_name)
      expect(rendered).to match(@t2.first_name)
    end
  end
end

require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  describe 'endpoints' do
    describe 'GET #index' do
      before do
        create(:coordinator, id: 1, affiliate_id: 1)

        affiliate1 = create(:affiliate)
        affiliate2 = create(:affiliate)
        tutor1 = create(:tutor)
        tutor2 = create(:tutor)
        student1 = create(:student)
        student2 = create(:student)
        create(:enrollment, student: student1, affiliate: affiliate1)
        create(:enrollment, student: student2, affiliate: affiliate2)
        create(:volunteer_job, tutor: tutor1, affiliate: affiliate1)
        create(:volunteer_job, tutor: tutor2, affiliate: affiliate2)
        @match1 = create(:match, tutor: tutor1, student: student1)
        @match2 = create(:match, tutor: tutor2, student: student2)
      end

      describe 'as admin' do
        before do
          user = User.new(role: 2)
          sign_in_auth(user)
        end

        it 'populates an array of all matches' do
          get :index
          expect(assigns(:models)).to eq([@match1, @match2])
        end

        it 'renders the :index view' do
          get :index
          expect(response).to render_template :index
        end
      end
    end
  end
end

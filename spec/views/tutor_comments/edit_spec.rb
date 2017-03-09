require 'rails_helper'

RSpec.describe 'tutor_comments/edit', type: :view do
  before(:each) do
    tutor = assign(:tutor, create(:tutor))
    @tutor_comment =
      assign(:tutor_comment, create(:tutor_comment, tutor_id: tutor.id))
  end

  it 'renders the edit tutor_comment form' do
    render

    assert_select 'form[action=?][method=?]',
                  tutor_comment_path(@tutor_comment),
                  'post' do
    end
  end
end

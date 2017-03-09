require 'rails_helper'

RSpec.describe 'tutor_comments/new', type: :view do
  before(:each) do
    @tutor = assign(:tutor, create(:tutor))
    @tutor_comment =
      assign(:tutor_comment, create(:tutor_comment, tutor_id: @tutor.id))
  end

  it 'renders new tutor_comment form' do
    render

    assert_select 'form[action=?][method=?]', tutor_comments_path, 'post' do
    end
  end
end

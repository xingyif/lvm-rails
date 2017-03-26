require 'rails_helper'

RSpec.describe 'coordinators/new', type: :view do
  before(:each) do
    assign(:coordinator, Coordinator.new)
  end

  it 'should renders the new form' do
    render

    assert_select 'form[action=?][method=?]', coordinators_path, 'post' do
    end
  end
end

require 'rails_helper'

RSpec.describe VolunteerJob, type: :model do
  describe 'associations' do
    it 'should belong to a coordinator' do
      should belong_to(:coordinator)
    end

    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end
  end
end

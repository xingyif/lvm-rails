require 'rails_helper'

RSpec.describe TutoringSession, type: :model do
  describe 'associations' do
    it 'should belong to a match' do
      should belong_to(:match)
    end
  end

  describe 'validations' do
    describe 'match' do
      it 'presence' do
        should validate_presence_of(:match)
      end
    end

    describe 'location' do
      it 'presence' do
        should validate_presence_of(:location)
      end
    end

    describe 'hours' do
      it 'presence' do
        should validate_presence_of(:hours)
      end

      it 'length' do
        should validate_length_of(:hours)
      end
    end

    describe 'start_date' do
      it 'presence' do
        should validate_presence_of(:start_date)
      end
    end

    describe 'end_date' do
      it 'presence' do
        should validate_presence_of(:end_date)
      end
    end

    describe 'custom validations' do
      it 'should not allow a session with end date before start date' do
        TutoringSession.new(match_id: 1,
                            location: 'here',
                            hours: 1,
                            start_date: Date.today,
                            end_date: Date.today - 1)
        expect(TutoringSession.count).to eq(0)
      end

      it 'should not allow a session with end date not before start date' do
        TutoringSession.new(match_id: 1,
                            location: 'here',
                            hours: 1,
                            start_date: Date.today,
                            end_date: Date.today)
        expect(TutoringSession.count).to eq(0)
      end
    end
  end
end

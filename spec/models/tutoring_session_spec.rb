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
      before do
        s = create(:student)
        t = create(:tutor)
        a = create(:affiliate)
        create(:volunteer_job, tutor: t, affiliate: a)
        create(:enrollment, student: s, affiliate: a)
        @match = create(:match, student: s, tutor: t)
      end

      it 'should not allow a session with end date before start date' do
        TutoringSession.create(match: @match,
                               location: 'here',
                               hours: 1,
                               start_date: Date.today,
                               end_date: Date.today - 1)
        expect(TutoringSession.count).to eq(0)
      end

      it 'should allow a session with end date not before start date' do
        TutoringSession.create(match: @match,
                               location: 'here',
                               match_id: 1,
                               hours: 1,
                               start_date: Date.today,
                               end_date: Date.today)
        expect(TutoringSession.count).to eq(1)
      end
    end
  end

  describe 'methods' do
    before do
      @tutor = create(:tutor)
      @student = create(:student)

      affiliate = create(:affiliate)

      create(:enrollment, student: @student, affiliate: affiliate)
      create(:volunteer_job, tutor: @tutor, affiliate: affiliate)
      match = create(:match, student: @student, tutor: @tutor)
      @tutoring_session = create(:tutoring_session, match: match)
    end

    describe '#student_first_name' do
      it "returns the student's first name" do
        expect(@tutoring_session.student_first_name).to eq(@student.first_name)
      end
    end

    describe '#student_last_name' do
      it "returns the student's last name" do
        expect(@tutoring_session.student_last_name).to eq(@student.last_name)
      end
    end

    describe '#tutor_first_name' do
      it "returns the tutor's first name" do
        expect(@tutoring_session.tutor_first_name).to eq(@tutor.first_name)
      end
    end

    describe '#tutor_last_name' do
      it "returns the tutor's last name" do
        expect(@tutoring_session.tutor_last_name).to eq(@tutor.last_name)
      end
    end
  end
end

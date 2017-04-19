require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end

    it 'should belong to a student' do
      should belong_to(:student)
    end
  end

  describe 'validations' do
    describe 'start date' do
      before do
        affiliate = create(:affiliate)
        @student = create(:student)
        @tutor = create(:tutor)
        create(:volunteer_job, tutor: @tutor, affiliate: affiliate)
        create(:enrollment, student: @student, affiliate: affiliate)
      end
      subject { create(:match, student: @student, tutor: @tutor) }
      it 'should validate presence' do
        should validate_presence_of(:start)
      end
    end

    describe 'custom validations' do
      before do
        @tutor1 = create(:tutor)
        @tutor2 = create(:tutor)
        @student1 = create(:student)

        affiliate1 = create(:affiliate)
        affiliate2 = create(:affiliate)

        create(:enrollment, student: @student1, affiliate: affiliate1)
        create(:volunteer_job, tutor: @tutor1, affiliate: affiliate1)
        create(:volunteer_job, tutor: @tutor2, affiliate: affiliate2)
      end

      it 'should not allow a tutor and student from different affiliates' do
        Match.new(tutor_id: @tutor2.id,
                  student_id: @student1.id,
                  start: Date.today).save
        expect(Match.count).to eq(0)
      end

      it 'should allow a tutor and student from the same affiliate' do
        Match.new(tutor_id: @tutor1.id,
                  student_id: @student1.id,
                  start: Date.today).save
        expect(Match.count).to eq(1)
      end

      it 'should not allow a duplicate match' do
        Match.new(tutor_id: @tutor1.id,
                  student_id: @student1.id,
                  start: Date.today).save
        Match.new(tutor_id: @tutor1.id,
                  student_id: @student1.id,
                  start: Date.today).save
        expect(Match.count).to eq(1)
      end
    end
  end

  describe '#of' do
    before do
      affiliate1 = create(:affiliate)
      affiliate2 = create(:affiliate)

      tutor1 = create(:tutor)
      tutor2 = create(:tutor)
      student1 = create(:student)
      student2 = create(:student)

      @coordinator = create(:coordinator, affiliate: affiliate1)

      create(:volunteer_job, affiliate: affiliate1, tutor: tutor1)
      create(:volunteer_job, affiliate: affiliate2, tutor: tutor2)
      create(:enrollment, affiliate: affiliate1, student: student1)
      create(:enrollment, affiliate: affiliate2, student: student2)
      @m1 = create(:match, student: student1, tutor: tutor1)
      @m2 = create(:match, student: student2, tutor: tutor2)
    end

    describe 'when current user is admin' do
      before do
        @user = User.new(role: 2,
                         email: 't@b.co',
                         password: 'abcdef',
                         password_confirmation: 'abcdef')
      end

      it 'returns all matches' do
        matches = Match.of(@user)
        expect(matches).to eq([@m1, @m2])
      end
    end

    describe 'when current user is coordinator' do
      before do
        @user = User.new(coordinator_id: @coordinator.id,
                         role: 1,
                         email: 't@b.co',
                         password: 'abcdef',
                         password_confirmation: 'abcdef')
      end

      it 'returns affiliated matches' do
        matches = Match.of(@user)
        expect(matches).to eq([@m1])
      end
    end

    describe 'when current user is coordinator' do
      before do
        @user = User.new(role: 0,
                         email: 't@b.co',
                         password: 'abcdef',
                         password_confirmation: 'abcdef')
      end

      it 'returns nothing' do
        matches = Match.of(@user)
        expect(matches).to eq(nil)
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
      @match = create(:match, student: @student, tutor: @tutor)
    end

    describe '#student_first_name' do
      it "returns the student's first name" do
        expect(@match.student_first_name).to eq(@student.first_name)
      end
    end

    describe '#student_last_name' do
      it "returns the student's last name" do
        expect(@match.student_last_name).to eq(@student.last_name)
      end
    end

    describe '#tutor_first_name' do
      it "returns the tutor's first name" do
        expect(@match.tutor_first_name).to eq(@tutor.first_name)
      end
    end

    describe '#tutor_last_name' do
      it "returns the tutor's last name" do
        expect(@match.tutor_last_name).to eq(@tutor.last_name)
      end
    end
  end
end

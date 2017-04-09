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
    xit 'should validate presence of start date' do
      should validate_presence_of(:start)
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
    end
  end
end

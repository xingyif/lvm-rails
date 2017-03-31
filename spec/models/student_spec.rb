require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'associations' do
    it 'should have many matches' do
      should have_many(:matches)
    end

    it 'tutors through matches' do
      should have_many(:tutors).through(:matches)
    end

    it 'should have many enrollments' do
      should have_many(:enrollments)
    end

    it 'coordinators through enrollments' do
      should have_many(:coordinators).through(:enrollments)
    end

    it 'should have many assessments' do
      should have_many(:assessments)
    end

    it 'should have many taggings' do
      should have_many(:taggings)
    end

    it 'should have many tags through taggings' do
      should have_many(:tags).through(:taggings)
    end
  end

  describe 'validations' do
    describe 'first_name' do
      it 'validates presence' do
        should validate_presence_of(:first_name)
      end
    end

    describe 'last_name' do
      it 'validates presence' do
        should validate_presence_of(:last_name)
      end
    end

    describe 'last_name_id' do
      it 'validates format' do
        should allow_value('0123').for(:last_name_id)
        should allow_value('01234').for(:last_name_id)
        should_not allow_value('012').for(:last_name_id)
        should_not allow_value('012345').for(:last_name_id)
        should_not allow_value('O1234').for(:last_name_id)
      end
    end

    describe 'cell_phone' do
      it 'validates format' do
        should allow_value('(555) 555-5555').for(:cell_phone)
        should_not allow_value('555-555-5555').for(:cell_phone)
        should_not allow_value('43-4343-4444').for(:cell_phone)
        should_not allow_value('434-3433-4444').for(:cell_phone)
        should_not allow_value('434-434-444').for(:cell_phone)
        should_not allow_value('4333-433-4444').for(:cell_phone)
        should_not allow_value('(232) 343-99439').for(:cell_phone)
        should_not allow_value('(abc) 123-defg').for(:cell_phone)
      end
    end

    describe 'home_phone' do
      it 'validates format' do
        should allow_value('(555) 555-5555').for(:home_phone)
        should_not allow_value('555-555-5555').for(:home_phone)
        should_not allow_value('43-4343-4444').for(:home_phone)
        should_not allow_value('434-3433-4444').for(:home_phone)
        should_not allow_value('434-434-444').for(:home_phone)
        should_not allow_value('4333-433-4444').for(:home_phone)
        should_not allow_value('(232) 343-99439').for(:home_phone)
        should_not allow_value('(abc) 123-defg').for(:cell_phone)
      end
    end

    describe 'work_phone' do
      it 'validates format' do
        should allow_value('(555) 555-5555').for(:work_phone)
        should_not allow_value('555-555-5555').for(:work_phone)
        should_not allow_value('43-4343-4444').for(:work_phone)
        should_not allow_value('434-3433-4444').for(:work_phone)
        should_not allow_value('434-434-444').for(:work_phone)
        should_not allow_value('4333-433-4444').for(:work_phone)
        should_not allow_value('(232) 343-99439').for(:work_phone)
        should_not allow_value('(abc) 123-defg').for(:work_phone)
      end
    end

    describe 'zip' do
      it 'validates format' do
        should allow_value('03923').for(:zip)
        should allow_value('54321').for(:zip)
        should_not allow_value('1234').for(:zip)
        should_not allow_value('123456').for(:zip)
        should_not allow_value('abcde').for(:zip)
      end
    end

    describe 'email' do
      subject { FactoryGirl.build(:student) }

      it 'validates length' do
        should validate_length_of(:email)
          .is_at_most(255)
      end

      it 'validates format' do
        should allow_value('email@address.foo').for(:email)
        should_not allow_value('foo').for(:email)
        should_not allow_value('foo@').for(:email)
        should_not allow_value('foo@address').for(:email)
        should_not allow_value('address.foo').for(:email)
      end

      it 'validates uniqueness' do
        should validate_uniqueness_of(:email).case_insensitive
      end
    end
  end

  describe '#name' do
    it 'concatenates first_name and last_name' do
      student = create(:student, first_name: 'Test', last_name: 'Testerson',
                                 gender: 'male')
      full_name = 'Test Testerson'
      expect(student.name).to eq(full_name)
    end
  end

  describe '#current_availability_array' do
    context 'with no value for availability' do
      it 'produces an empty array' do
        student = create(:student, availability: nil)
        expect(student.current_availability_array).to eq []
      end
    end

    context 'when the student has an availability value' do
      it 'produces an array representing availability as powers of two' do
        student = create(:student, availability: 21)
        expect(student.current_availability_array).to eq [1, 0, 4, 0, 16]
      end
    end
  end

  describe '#transportation_preference_array' do
    context 'with no value for transportation' do
      it 'produces an empty array' do
        student = create(:student, transportation: nil)
        expect(student.transportation_preference_array).to eq []
      end
    end

    context 'when the student has an transportation value' do
      it 'produces an array representing transportation as powers of two' do
        student = create(:student, transportation: 21)
        expect(student.transportation_preference_array).to eq [1, 0, 4, 0, 16]
      end
    end
  end

  describe '#age_preference_array' do
    context 'with no value for age_preference' do
      it 'produces an empty array' do
        student = create(:student, age_preference: nil)
        expect(student.age_preference_array).to eq []
      end
    end

    context 'when the student has a category_preference value' do
      it 'produces an array representing that preference as powers of two' do
        student = create(:student, age_preference: 19)
        expect(student.age_preference_array).to eq [1, 2, 0, 0, 16]
      end
    end
  end

  describe '#all_tags' do
    before do
      @student = create(:student)
      @tag = Tag.create(name: 'Donor')
      Tagging.create(student_id: @student.id, tag_id: @tag.id)
    end

    context 'getter' do
      it 'produces the tags for a given student as an array of strings' do
        expect(@student.all_tags).to eq ['Donor']
      end
    end

    context 'setter' do
      it 'adds a new tag to the tag list' do
        @student.all_tags = ['Another Tag', 'Donor']
        expect(@student.all_tags).to eq ['Donor', 'Another Tag']
      end

      it 'removes a tag that was already present' do
        @student.all_tags = ['Another Tag']
        expect(@student.all_tags).to eq ['Another Tag']
        expect(Tagging.where(student_id: @student.id).count).to eq 1
      end

      it 'does not duplicate an already added tag' do
        @student.all_tags = ['Another Tag', 'Donor', 'Another Tag', 'Another']
        expect(@student.all_tags).to eq ['Donor', 'Another Tag', 'Another']
        expect(Tagging.where(student_id: @student.id).count).to eq 3
      end

      it 'rejects empty values in the array' do
        @student.all_tags = ['Another Tag', '', 'Donor', '']
        expect(@student.all_tags).to eq ['Donor', 'Another Tag']
        expect(Tagging.where(student_id: @student.id).count).to eq 2
      end
    end
  end

  describe '#status_class_indicator' do
    it 'returns the success contextual class for active students' do
      @student = create(:student, status: 'Active')
      expect(@student.status_class_indicator).to eq 'success'
    end

    it 'returns the info contextual class for waiting students' do
      @student = create(:student, status: 'On hold')
      expect(@student.status_class_indicator).to eq 'info'
    end

    it 'returns the warning contextual class for problematic students' do
      @student = create(:student, status: 'Moved')
      expect(@student.status_class_indicator).to eq 'warning'
    end

    it 'returns the danger contextual class for exited students' do
      @student = create(:student, status: 'Exited')
      expect(@student.status_class_indicator).to eq 'danger'
    end
  end
end

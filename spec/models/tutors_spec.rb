require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'associations' do
    it 'should have many matches' do
      should have_many(:matches)
    end

    it 'students through matches' do
      should have_many(:students).through(:matches)
    end

    it 'should have many volunteer_jobs' do
      should have_many(:volunteer_jobs)
    end

    it 'coordinators through volunteer_jobs' do
      should have_many(:coordinators).through(:volunteer_jobs)
    end

    it 'should have many tutor_comments' do
      should have_many(:tutor_comments)
    end

    it 'should have many taggings' do
      should have_many(:taggings)
    end

    it 'should have many tags through taggings' do
      should have_many(:tags).through(:taggings)
    end
  end

  describe 'validations' do
    describe 'address1' do
      it 'validates presence' do
        should validate_presence_of(:address1)
      end
    end

    describe 'address2' do
      it 'validates presence' do
        should validate_presence_of(:address2)
      end
    end

    describe 'cell_phone' do
      it 'validates presence' do
        should validate_presence_of(:cell_phone)
      end

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

    describe 'city' do
      it 'validates presence' do
        should validate_presence_of(:city)
      end
    end

    describe 'country_of_birth' do
      it 'validates presence' do
        should validate_presence_of(:country_of_birth)
      end
    end

    describe 'date_of_birth' do
      it 'validates presence' do
        should validate_presence_of(:date_of_birth)
      end
    end

    describe 'email_other' do
      subject { FactoryGirl.build(:tutor) }

      it 'validates length' do
        should validate_length_of(:email_other)
          .is_at_most(255)
      end

      it 'validates format' do
        should allow_value('email@address.foo').for(:email_other)
        should_not allow_value('foo').for(:email_other)
        should_not allow_value('foo@').for(:email_other)
        should_not allow_value('foo@address').for(:email_other)
        should_not allow_value('address.foo').for(:email_other)
      end

      it 'validates uniqueness' do
        should validate_uniqueness_of(:email_other).case_insensitive
      end
    end

    describe 'email_preferred' do
      subject { FactoryGirl.build(:tutor) }

      it 'validates presence' do
        should validate_presence_of(:email_preferred)
      end

      it 'validates length' do
        should validate_length_of(:email_preferred)
          .is_at_most(255)
      end

      it 'validates format' do
        should allow_value('email@address.foo').for(:email_preferred)
        should_not allow_value('foo').for(:email_preferred)
        should_not allow_value('foo@').for(:email_preferred)
        should_not allow_value('foo@address').for(:email_preferred)
        should_not allow_value('address.foo').for(:email_preferred)
      end

      it 'validates uniqueness' do
        should validate_uniqueness_of(:email_preferred).case_insensitive
      end
    end

    describe 'emergency_contact_email' do
      it 'validates presence' do
        should validate_presence_of(:emergency_contact_email)
      end
    end

    describe 'emergency_contact_name' do
      it 'validates presence' do
        should validate_presence_of(:emergency_contact_name)
      end
    end

    describe 'emergency_contact_phone' do
      it 'validates presence' do
        should validate_presence_of(:emergency_contact_name)
      end
    end

    describe 'first_name' do
      it 'validates presence' do
        should validate_presence_of(:first_name)
      end
    end

    describe 'hispanic_or_latino' do
      it 'validates presence' do
        should_not allow_value(nil).for(:hispanic_or_latino)
      end
    end

    describe 'home_phone' do
      it 'validates presence' do
        should validate_presence_of(:home_phone)
      end

      it 'validates format' do
        should allow_value('(555) 555-5555').for(:home_phone)
        should_not allow_value('555-555-5555').for(:home_phone)
        should_not allow_value('43-4343-4444').for(:home_phone)
        should_not allow_value('434-3433-4444').for(:home_phone)
        should_not allow_value('434-434-444').for(:home_phone)
        should_not allow_value('4333-433-4444').for(:home_phone)
        should_not allow_value('(232) 343-99439').for(:home_phone)
        should_not allow_value('(abc) 123-defg').for(:home_phone)
      end
    end

    describe 'language_proficiencies' do
      it 'validates presence' do
        should validate_presence_of(:language_proficiencies)
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

    describe 'native_language' do
      it 'validates presence' do
        should validate_presence_of(:native_language)
      end
    end

    describe 'occupation' do
      it 'validates presence' do
        should validate_presence_of(:occupation)
      end
    end

    describe 'other_phone' do
      it 'validates format' do
        should allow_value('(555) 555-5555').for(:other_phone)
        should_not allow_value('555-555-5555').for(:other_phone)
        should_not allow_value('43-4343-4444').for(:other_phone)
        should_not allow_value('434-3433-4444').for(:other_phone)
        should_not allow_value('434-434-444').for(:other_phone)
        should_not allow_value('4333-433-4444').for(:other_phone)
        should_not allow_value('(232) 343-99439').for(:other_phone)
        should_not allow_value('(abc) 123-defg').for(:other_phone)
      end
    end

    describe 'race' do
      it 'validates presence' do
        should validate_presence_of(:race)
      end
    end

    describe 'smartt_id' do
      it 'validates format' do
        should allow_value('0000-000000').for(:smartt_id)
        should_not allow_value('0000-00000').for(:smartt_id)
        should_not allow_value('0000000000').for(:smartt_id)
        should_not allow_value('O000-000000').for(:smartt_id)
        should_not allow_value('00000-00000').for(:smartt_id)
        should_not allow_value('0000-0000000').for(:smartt_id)
      end
    end

    describe 'state' do
      it 'validates presence' do
        should validate_presence_of(:state)
      end
    end

    describe 'zip' do
      it 'validates presence' do
        should validate_presence_of(:zip)
      end

      it 'validates format' do
        should allow_value('03923').for(:zip)
        should allow_value('54321').for(:zip)
        should_not allow_value('1234').for(:zip)
        should_not allow_value('123456').for(:zip)
        should_not allow_value('abcde').for(:zip)
      end
    end
  end

  describe 'methods' do
    describe '#name' do
      it 'concatenates first_name and last_name' do
        tutor = create(:tutor, first_name: 'Test', last_name: 'Testerson')
        full_name = 'Test Testerson'
        expect(tutor.name).to eq(full_name)
      end
    end

    describe '#current_availability_array' do
      context 'with no value for availability' do
        it 'produces an empty array' do
          tutor = create(:tutor, availability: nil)
          expect(tutor.current_availability_array).to eq []
        end
      end

      context 'when the tutor has an availability value' do
        it 'produces an array representing availability as powers of two' do
          tutor = create(:tutor, availability: 21)
          expect(tutor.current_availability_array).to eq [1, 0, 4, 0, 16]
        end
      end
    end

    describe '#category_preference_array' do
      context 'with no value for category_preference' do
        it 'produces an empty array' do
          tutor = create(:tutor, category_preference: nil)
          expect(tutor.current_availability_array).to eq []
        end
      end

      context 'when the tutor has a category_preference value' do
        it 'produces an array representing that preference as powers of two' do
          tutor = create(:tutor, category_preference: 14)
          expect(tutor.category_preference_array).to eq [0, 2, 4, 8]
        end
      end
    end

    describe '#age_preference_array' do
      context 'with no value for age_preference' do
        it 'produces an empty array' do
          tutor = create(:tutor, age_preference: nil)
          expect(tutor.age_preference_array).to eq []
        end
      end

      context 'when the tutor has a category_preference value' do
        it 'produces an array representing that preference as powers of two' do
          tutor = create(:tutor, age_preference: 19)
          expect(tutor.age_preference_array).to eq [1, 2, 0, 0, 16]
        end
      end
    end

    describe '#all_tags' do
      before do
        @tutor = create(:tutor)
        @tag = Tag.create(name: 'Donor')
        Tagging.create(tutor_id: @tutor.id, tag_id: @tag.id)
      end

      context 'getter' do
        it 'produces the tags for a given tutor as an array of strings' do
          expect(@tutor.all_tags).to eq ['Donor']
        end
      end

      context 'setter' do
        it 'adds a new tag to the tag list' do
          @tutor.all_tags = ['Another Tag', 'Donor']
          expect(@tutor.all_tags).to eq ['Donor', 'Another Tag']
        end

        it 'removes a tag that was already present' do
          @tutor.all_tags = ['Another Tag']
          expect(@tutor.all_tags).to eq ['Another Tag']
          expect(Tagging.where(tutor_id: @tutor.id).count).to eq 1
        end

        it 'does not duplicate an already added tag' do
          @tutor.all_tags = ['Another Tag', 'Donor', 'Another Tag', 'Another']
          expect(@tutor.all_tags).to eq ['Donor', 'Another Tag', 'Another']
          expect(Tagging.where(tutor_id: @tutor.id).count).to eq 3
        end

        it 'rejects empty values in the array' do
          @tutor.all_tags = ['Another Tag', '', 'Donor', '']
          expect(@tutor.all_tags).to eq ['Donor', 'Another Tag']
          expect(Tagging.where(tutor_id: @tutor.id).count).to eq 2
        end
      end
    end

    describe '#status_class_indicator' do
      it 'returns the success contextual class for active tutors' do
        @tutor = create(:tutor, status: 'Active')
        expect(@tutor.status_class_indicator).to eq 'success'
      end

      it 'returns the info contextual class for waiting tutors' do
        @tutor = create(:tutor, status: 'On hold')
        expect(@tutor.status_class_indicator).to eq 'info'
      end

      it 'returns the warning contextual class for problematic tutors' do
        @tutor = create(:tutor, status: 'Moved')
        expect(@tutor.status_class_indicator).to eq 'warning'
      end

      it 'returns the danger contextual class for exited tutors' do
        @tutor = create(:tutor, status: 'Exited')
        expect(@tutor.status_class_indicator).to eq 'danger'
      end
    end
  end

  describe '#of' do
    before do
      create(:affiliate, id: 1)
      create(:affiliate, id: 2)

      create(:coordinator, affiliate_id: 1, id: 1)

      create(:tutor, affiliate_id: 1, id: 1)
      create(:tutor, affiliate_id: 2, id: 2)

      Tutor.find(1).coordinators << Coordinator.find(1)
    end

    describe 'when current user is tutor' do
      before do
        @user = User.new(tutor_id: 1,
                         role: 0,
                         email: 't@b.co',
                         password: 'abcdef',
                         password_confirmation: 'abcdef')
      end

      it 'returns no tutors' do
        tutors = Student.of(@user)
        expect(tutors).to be(nil)
      end
    end

    describe 'when current user is coordinator' do
      before do
        @user = User.new(coordinator_id: 1,
                         role: 1,
                         email: 'c@b.co',
                         password: 'abcdef',
                         password_confirmation: 'abcdef')
      end

      it 'returns only tutors of coordinator affiliate' do
        tutors = Tutor.of(@user)
        expect(tutors.count).to eq(1)
        expect(tutors.first.id).to eq(1)
      end
    end

    describe 'when current user is admin' do
      before do
        @user = User.new(role: 2,
                         email: 'a@b.co',
                         password: 'abcdef',
                         password_confirmation: 'abcdef')
      end

      it 'returns all tutors' do
        tutors = Tutor.of(@user)
        expect(tutors.count).to eq(2)
      end
    end
  end
end

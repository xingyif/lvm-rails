require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it 'should have many taggings' do
      should have_many(:taggings)
    end

    it 'should have many tutors and students through taggings' do
      should have_many(:tutors).through(:taggings)
      should have_many(:students).through(:taggings)
    end

    it 'should destroy taggings upon deletion' do
      should have_many(:taggings).dependent(:destroy)
    end
  end

  describe 'validations' do
    describe 'name' do
      it 'should validate the uniqueness' do
        should validate_uniqueness_of(:name)
      end

      it 'should validate length > 0' do
        should validate_length_of(:name).is_at_least(1)
      end
    end
  end

  describe '#count' do
    it 'should return a count of items tagged with the tag' do
      @tag = create(:tag)
      expect(@tag.count).to eq 0
      Tagging.create(tag_id: @tag.id)
      expect(@tag.count).to eq 1
    end
  end

  describe '#created_string' do
    it 'produces the proper date string' do
      @tag = create(:tag, created_at: Time.at(949_320_000))
      expect(@tag.created_string).to eq '2000-01-31'
    end
  end

  describe '#updated_string' do
    it 'produces the proper date string' do
      @tag = create(:tag, updated_at: Time.at(949_320_000))
      expect(@tag.updated_string).to eq '2000-01-31'
    end
  end
end

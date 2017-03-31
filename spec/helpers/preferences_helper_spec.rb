require 'rails_helper'

RSpec.describe PreferencesHelper, type: :helper do
  describe '#squash' do
    it 'returns 0 for an empty array' do
      expect(squash([])).to eq 0
    end

    it 'computes the sum of an array of integers' do
      arr = [1, 5, 2, 4, 3]
      expect(squash(arr)).to eq 15
    end

    it 'computes the sum of an array of strings of integers' do
      arr = ['1', '3', '32', '4']
      expect(squash(arr)).to eq 40
    end

    it 'handles a mix of strings and integers' do
      arr = ['3', 1, '2']
      expect(squash(arr)).to eq 6
    end

    it 'handles empty string values and negative numbers' do
      arr = ['-2', 8, '', -2]
      expect(squash(arr)).to eq 4
    end
  end

  describe '#availability_match' do
    it 'returns 0 when no matching bits are found' do
      expect(availability_match(8, 1)).to eq 0
    end

    it 'returns the number of matching 1 bits in the two inputs' do
      expect(availability_match(0b11011010, 0b10001001)).to eq 2
    end

    it 'handles various inputs' do
      expect(availability_match(7, 2)).to eq 1
      expect(availability_match('7', 2)).to eq 1
      expect(availability_match(0b111, 0b10)).to eq 1
    end
  end

  describe '#explode' do
    it 'returns an array of integer powers of two that make up the number' do
      expect(explode(5)).to eq [1, 0, 4]
      expect(explode(34)).to eq [0, 2, 0, 0, 0, 32]
    end

    it 'handles the zero case' do
      expect(explode(0)).to eq [0]
    end
  end
end

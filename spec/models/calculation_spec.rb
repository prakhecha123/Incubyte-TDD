require 'rails_helper'

RSpec.describe Calculation, type: :model do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(Calculation.add('')).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(Calculation.add('1')).to eq(1)
    end

    it 'returns the sum for multiple numbers separated by commas' do
      expect(Calculation.add('1,5')).to eq(6)
    end

    it 'handles new lines between numbers' do
      expect(Calculation.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(Calculation.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      expect { Calculation.add("-1,2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed: -1,-3")
    end
  end
end

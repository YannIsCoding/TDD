# test for the random generator

require_relative '../random_generator'

describe RandomGenerator do
  describe '#random_generator.letter' do
    result = RandomGenerator.letter
    it 'return a string' do
      expect(result.class).to eq(String)
    end

    it 'return a 10 length charactere is no argument is given' do
      expect(result.length).to eq(10)
    end

    it 'return a string length equal to the argument given' do
      result = RandomGenerator.letter(20)
      expect(result.length).to eq(20)
    end

    it 'return a string with a mix of upcase and lowcase if second argument is set to true' do
      result = RandomGenerator.letter(12, true)
      expect(result.downcase).not_to eq(result)
    end
  end

  describe '#random_generator.number' do
    result = RandomGenerator.number
    it 'return a integer' do
      expect(result.class).to eq(Integer)
    end

    it 'doesnt always return the same number' do
      result = []
      10.times do
        result << RandomGenerator.number
      end
      expect(result).to eq(result.uniq)
    end

    it 'return a number with the same length as the given argument' do
      result = RandomGenerator.number(14)
      expect(result.to_s.length).to eq(14)
    end

  end
end

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

    it 'is random on average' do
      # check probablitiy of each letter to see if code is really random
      code_length = 10
      nb_cycles = 20_000
      prob_of_each_letter = 1 / 26.0
      deviation_point = 0.05
      perfect_prob_of_letter = code_length * nb_cycles * prob_of_each_letter
      deviation = perfect_prob_of_letter * deviation_point
      upper_limit = perfect_prob_of_letter + deviation / 2
      lower_limit = perfect_prob_of_letter - deviation / 2
      result = ''
      nb_cycles.times do
        result += RandomGenerator.letter(code_length)
      end
      analyzer = {}
      result.split(//).each do |letter|
        analyzer[letter].nil? ? analyzer[letter] = 1 : analyzer[letter] += 1
      end
      not_random = false
      analyzer.each do |_key, value|
        not_random = true if value > upper_limit && lower_limit < 18_942
      end

      expect(not_random).to eq(false)
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

  describe '#random_generator.number_letter' do
    result = RandomGenerator.number_letter
    it 'contains integer' do
      match = false
      result.split(//).each { |x| match = true if x.to_i.positive? }
      expect(match).to eq(true)
    end

    it 'contains string' do
      match = false
      result.split(//).each { |x| match = true if x.class == String }
      expect(match).to eq(true)
    end
  end
end

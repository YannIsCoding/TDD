class RandomGenerator

  def self.letter(length = 10, caps_on = false)
    alphabet = caps_on ? [('a'..'z').to_a, ('A'..'Z').to_a].flatten : ('a'..'z').to_a
    (1..length).to_a.map { |letter| letter = alphabet.sample }.join
  end

  def self.number(length = 10)
    p Time.now.hash.abs.to_s[0..length - 1].to_i
  end
end

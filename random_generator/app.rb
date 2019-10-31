require_relative 'random_generator'

stop = false

until stop

  puts 'What kind of random code do you want?'
  puts '1 - letter code'
  puts '2 - integer code'
  puts '3 - letter and integer code'
  puts '4 - exit'

  result = gets.chomp.to_i

  case result
  when 1
    puts RandomGenerator.letter
  when 2
    puts RandomGenerator.number
  when 3
    puts RandomGenerator.number_letter
  when 4
    stop = true
  end

end

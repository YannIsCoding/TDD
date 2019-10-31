RPS = %w(rock paper scissors)

def rock_paper_scissors
  puts 'Welcome to the game!'
  puts 'Please type in an option:'
  puts '1 - Rock'
  puts '2 - Paper'
  puts '3 - Scissors'
  user_choice = gets.chomp.downcase
  computer_choice = RPS.sample
  puts "You choose #{user_choice}"
  puts "the computer choose #{computer_choice}"

  case user_choice
  when 'rock'
    if computer_choice == 'rock'
      puts 'equlity'
    elsif computer_choice == 'paper'
      puts 'you lose'
    else
      puts 'you win'
    end
  when 'paper'
    if computer_choice == 'paper'
      puts 'equality'
    elsif computer_choice == 'scissors'
      puts 'you lose'
    else
      puts 'you win'
    end
  when 'scissors'
    if computer_choice == 'scissors'
      puts 'equality'
    elsif computer_choice == 'rock'
      puts 'you lose'
    else
      puts 'you win'
    end
  end

end


rock_paper_scissors

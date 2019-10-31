class View
  def initialize
    puts 'Welcome to the game!'
  end

  def display_options
    puts 'Please select a number:'
    puts '1 - Rock'
    puts '2 - Paper'
    puts '3 - Scissors'
    puts '4 - Enough!'
    gets.chomp.to_i
  end

  def display(player, choice)
    puts "#{player} has choosen #{choice}"
  end

  def result(winner)
    puts "#{winner} wins!"
  end

  def score(computer_score, player_score)
    puts "computer: #{computer_score} -- player: #{player_score}"
  end
end

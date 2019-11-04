class View
  def name_of(player)
    puts "What is the name of #{player}?"
    gets.chomp
  end

  def display(grid)
    puts "   1  2  3"
    grid.each_with_index do |row, index|
      puts "#{index + 1} #{row.join}"
    end
  end

  def get_position(player)
    puts "#{player} please select one cell number (eg: 11 for top left one):"
    gets.chomp
  end

  def wrong_input
    puts 'Wrong input, try again'
  end

  def winner(player)
    puts "Winner is #{player.name}"
  end
end

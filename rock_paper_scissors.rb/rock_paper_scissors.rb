# RPS class keeps track of the score and return the winner.
class RockPaperScissors
  attr_reader :score_player, :score_computer
  def initialize
    @score_player = 0
    @score_computer = 0
  end

  def computer_choice
    RPS.sample
  end

  def who_is_the_winner(index_c, index_p)
    if index_c == index_p
      'equality'
    elsif index_c + 1 == index_p || index_c == 2 && index_p.zero?
      @score_player += 1
      'player'
    else
      @score_computer += 1
      'computer'
    end
  end
end

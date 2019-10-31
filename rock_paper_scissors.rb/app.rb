require_relative 'constant'
require_relative 'rock_paper_scissors'
require_relative 'rps_view'

def run
  view = View.new
  rps = RockPaperScissors.new
  input = view.display_options - 1

  until input == 3
    player_choice = RPS[input]
    computer_choice = rps.computer_choice
    view.display('player', player_choice)
    view.display('computer', computer_choice)
    result = rps.who_is_the_winner(RPS.index(computer_choice), RPS.index(player_choice))
    view.result(result)
    view.score(rps.score_computer, rps.score_player)
    input = view.display_options - 1
  end

  puts 'Bye bye!'
end

run

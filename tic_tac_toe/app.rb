require_relative 'view'
require_relative 'player'
require_relative 'controller'
def run
  @view = View.new
  Player.new(name: @view.name_of('first player'), sign: '[X]')
  Player.new(name: @view.name_of('second player'), sign: '[O]')
  Player.next_player
  game = TicTacToe.new
  controller = Controller.new(game: game)
  result = false
  while result == false
  result = controller.run_game
  print `clear`
  end

  @view.display(game.grid)
  @view.winner(result)
end

run

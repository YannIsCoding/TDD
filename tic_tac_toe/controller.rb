require_relative 'view'
require_relative 'tic_tac_toe'

class Controller
  attr_reader :game, :view
  def initialize(attrs = {})
    @game = attrs[:game]
    @view = View.new
  end

  def run_game
    @view.display(@game.grid)
    input = @view.get_position(Player.active_player.name)

    if @game.play(input)
      return Player.active_player if @game.victory?

      Player.next_player
      return false
    end

    @view.wrong_input
    run_game
  end
end

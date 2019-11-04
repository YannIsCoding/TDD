require_relative '../tic_tac_toe'
require_relative '../player'
require_relative '../controller'

describe TicTacToe do
  before(:each) do
    def init_game
      player1 = Player.new(name: 'Elon Musk')
      player2 = Player.new(name: 'Jeff Bezos')
      @new_game = TicTacToe.new(player1: player1, player2: player2)
    end
    init_game
  end

  it 'initialize with an empty grid' do
    expect(@new_game.grid).to be_an_instance_of(Array)
    expect(@new_game.grid[0]).to be_an_instance_of(Array)
    expect(@new_game.grid[1]).to be_an_instance_of(Array)
    expect(@new_game.grid[2]).to be_an_instance_of(Array)
    expect(@new_game.grid[2][0]).to be_an_instance_of(String)
  end

  it '#play method should change the grid' do
    grid = Marshal.load(Marshal.dump(@new_game.grid))
    @new_game.play('11')
    expect(grid).to_not eq(@new_game.grid)
  end

  it '#play method should change only the targeted cell' do
    @new_game.play('22')
    result = []
    @new_game.grid.each_with_index do |row, index_row|
      row.each_with_index do |cell, index_column|
        result << (index_row + 1).to_s + (index_column + 1).to_s if cell != '[ ]'
      end
    end
    expect(result.join).to eq('22')
  end

  it '#play should return false if wrong cell is given' do
    @new_game.play('22')
    expect(@new_game.play('42')).to eq(false)
    expect(@new_game.play('10')).to eq(false)
    expect(@new_game.play('17')).to eq(false)
    expect(@new_game.play('22')).to eq(false)
  end

  it '#play should change the @turn value each time its called with a correct position' do
    first_turn = @new_game.turn
    @new_game.play('22')
    expect(first_turn).to_not eq(@new_game.turn)
    @new_game.play('12')
    expect(@new_game.turn).to eq(first_turn)
    @new_game.play('42')
    expect(@new_game.turn).to eq(first_turn)
  end

  it '#victory? should return false if no winner' do
    expect(@new_game.victory?).to eq(false)
    @new_game.play('11')
    @new_game.play('12')
    expect(@new_game.victory?).to eq(false)
  end

  it '#victory? should return true for 3 sign on the same line' do
    %w[11 21 12 31 13].each { |pos| @new_game.play(pos) }
    expect(@new_game.victory?).to eq(true)
    init_game
    %w[11 21 12 22 33 23].each { |pos| @new_game.play(pos) }
    expect(@new_game.victory?).to eq(true)
  end

  it '#victory? should return true for 3 sign on the same column' do
    %w[11 12 21 22 31].each { |pos| @new_game.play(pos) }
    expect(@new_game.victory?).to eq(true)
    init_game
    %w[11 12 21 22 33 32].each { |pos| @new_game.play(pos) }
    expect(@new_game.victory?).to eq(true)
  end

  it '#victory? should return true for 3 sign on the digonal' do
    %w[11 21 22 31 33].each { |pos| @new_game.play(pos) }
    expect(@new_game.victory?).to eq(true)
    init_game
    %w[11 13 12 22 33 31].each { |pos| @new_game.play(pos) }
    expect(@new_game.victory?).to eq(true)
  end
end

describe Player do
  it 'should store all instances in an class variable' do
    2.times { Player.new }
    expect(Player.instances.length).to eq(2)
  end

  it 'should be able to change the active player' do
    2.times { Player.new }
    first_player = Player.next_player
    expect(Player.active).to be_an_instance_of(Player)
    expect(Player.next_player).to_not eq(first_player)
  end
end

describe Controller do
  it 'should be initialize with and instance of TicTacToe and View' do
    controller = Controller.new(game: TicTacToe.new)
    expect(controller.game).to be_an_instance_of(TicTacToe)
    expect(controller.view).to be_an_instance_of(View)
  end

end

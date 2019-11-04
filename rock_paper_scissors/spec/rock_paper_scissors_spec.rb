# test for the random generator
require_relative '../constant'
require_relative '../rock_paper_scissors'
require_relative '../rps_view'

describe RockPaperScissors do
  before(:each) do
    @rps = RockPaperScissors.new
  end

  it '@rps class should have 2 variables to keep track of the score' do
    expect(@rps.instance_variable_get(:@score_player)).to eq(0)
    expect(@rps.instance_variable_get(:@score_computer)).to eq(0)
  end

  it 'return rock or paper or scissors' do
    result = @rps.computer_choice
    expect(result).to include('rock').or include('paper').or include('scissors')
  end
  it 'who_is_the_winner should take two arguments' do
    expect { @rps.who_is_the_winner(1, 2) }.to_not raise_error
  end

  it 'if both choose the same should return eqality and not change the score' do
    expect(@rps.who_is_the_winner(0, 0)).to eq('equality')
    expect(@rps.who_is_the_winner(1, 1)).to eq('equality')
    expect(@rps.who_is_the_winner(2, 2)).to eq('equality')
    expect(@rps.instance_variable_get(:@score_player)).to eq(0)
    expect(@rps.instance_variable_get(:@score_computer)).to eq(0)
  end

  it 'if computer choose [rock, paper, scissors] and player choose [scissors, rock, paper] should return computer and increment computer score' do
    expect(@rps.who_is_the_winner(0, 2)).to eq('computer')
    expect(@rps.who_is_the_winner(1, 0)).to eq('computer')
    expect(@rps.who_is_the_winner(2, 1)).to eq('computer')
    expect(@rps.instance_variable_get(:@score_player)).to eq(0)
    expect(@rps.instance_variable_get(:@score_computer)).to eq(3)
  end

  it 'if player choose [rock, paper, scissors] and computer choose [scissors, rock, paper] should return computer and incerement the score player' do
    expect(@rps.who_is_the_winner(2, 0)).to eq('player')
    expect(@rps.who_is_the_winner(0, 1)).to eq('player')
    expect(@rps.who_is_the_winner(1, 2)).to eq('player')
    expect(@rps.instance_variable_get(:@score_player)).to eq(3)
    expect(@rps.instance_variable_get(:@score_computer)).to eq(0)
  end
end

describe View do
  describe '#View.display_options' do
    view = View.new
    it 'return rock or paper or scissors' do
      expect(view.display_options.class).to be(Integer)
    end
  end
end

VALID_POSITION = [11, 12, 13, 21, 22, 23, 31, 32, 33].freeze

class TicTacToe
  attr_reader :grid, :turn
  def initialize(attrs = {})
    @grid = [['[ ]', '[ ]', '[ ]'], ['[ ]', '[ ]', '[ ]'], ['[ ]', '[ ]', '[ ]']]
    @turn = '[X]'
  end

  def play(pos)
    return false unless  VALID_POSITION.include?(pos.to_i)

    if @grid[pos[0].to_i - 1][pos[1].to_i - 1] == '[ ]'
      @grid[pos[0].to_i - 1][pos[1].to_i - 1] = @turn
      @turn = @turn == '[X]' ? '[O]' : '[X]'
    else
      false
    end
  end

  def victory?
    return true if col_or_row_full == true

    center_cell = @grid[1][1]
    cc = center_cell if ['[X]', '[O]'].include?(center_cell)
    return true if [@grid[0][0], @grid[0][2]].include?(cc) && [@grid[2][0], @grid[2][2]].include?(cc)

    false
  end

  def col_or_row_full
    hash_col = { 0 => [], 1 => [], 2 => [] }
    @grid.each do |row|
      return true if ['[X]', '[O]'].include?(row.uniq.join)

      row.each_with_index do |cell, index|
        hash_col[index] << cell
      end
    end

    hash_col.each do |_key, col|
      return true if ['[X]', '[O]'].include?(col.uniq.join)
    end
  end
end

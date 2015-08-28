class Board
  def initialize
    @grid = Array.new(9) {Array.new(9)}
    populate
  end

  def populate
    #generate tiles for each square on grid and assign to grid.
    #call neighbors on each tile.
    bomb_count = 10

    9.times do |row|
      9.times do |col|
        bombed = random
        bomb_count -= 1 if bombed
        @grid[row][col] = MinesweeperTile.new(bombed)
      end
    end
  end

  def render
    print (0..8).to_s
    print "\n"
    @grid.each_with_index do |row, row_idx|
      print row_idx.to_s
      row.each_with_index do |col, col_idx|
        print col.value
      end
      print "\n"
    end
  end

  def random
    chance = rand(7)
    chance.zero? ? true : false
  end

  def game_over?
    #return true if a bomb tile is revealed, or board_won?
  end

  def board_won?
    #return true if all tiles revealed or flagged, and no false_flags
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []= (pos, value)
    @grid[pos[0]][pos[1]] = value
  end

end

class Board
  def initialize
    @grid = Array.new(9) {Array.new(9)}
    populate
  end

  def populate
    #generate tiles for each square on grid and assign to grid.
    #call neighbors on each tile.
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

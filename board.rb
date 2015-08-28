require_relative "tile.rb"

class Board
  attr_reader :size, :grid

  def initialize(size = 9, bombs = 10)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
    populate(bombs)
  end

  def populate(bombs)
    #generate tiles for each square on grid and assign to grid.
    #call neighbors on each tile.
    bomb_count = bombs

    size.times do |row|
      size.times do |col|
        bombed = random
        bomb_count -= 1 if bombed
        bombed = false if bomb_count <= 0
        @grid[row][col] = MinesweeperTile.new([row,col],bombed)
      end
    end
  end

  def render
    print " "
    (0...@grid.length).each {|el| print el.to_s}
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
    # chance = rand(2)
    # chance.zero? ? true : false
    true
  end

  def game_over?
    #return true if a bomb tile is revealed, or board_won?
    @grid.each do |row|
      row.each do |tile|
        return true if tile.revealed && tile.bombed?
      end
    end

    return true if board_won?
    false
  end

  def board_won?
    #return true if all tiles revealed or flagged, and no false_flags
    @grid.all? do |row_of_tiles|
      row_of_tiles.all? do |tile|

        if tile.revealed
          true
        elsif tile.flagged && tile.bombed
          true
        else
          false
        end
      end
    end
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []= (pos, value)
    @grid[pos[0]][pos[1]] = value
  end

end

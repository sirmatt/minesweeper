require_relative 'board.rb'

class MinesweeperTile
  attr_accessor :bombed
  attr_reader :flagged, :revealed

  DELTA_POS = [[-1, -1],
  [-1, 0],
  [-1, 1],
  [0, -1],
  [0, 1],
  [1, -1],
  [1, 0],
  [1, 1]]

  def initialize(pos, bombed)
    @bombed, @pos, @flagged, @revealed,
    @neighbors_bomb_count, @neighbors = bombed, pos, false, false, 0, []
  end

  def reveal(board, last_pos = nil)
    if flagged || revealed
      puts "you can't reveal that tile" unless last_pos
      return
    end
    #set reveal to true, return neighbor_bomb count, or blow you up if bomb
    @revealed = true
    return :boom if @bombed
    neighbors(board)
    neighbor_bomb_count
    if @neighbor_bomb_count.zero?
      @neighbors.each do |neighbor|
         unless neighbor == last_pos
           neighbor.reveal(board,self)
         end
       end
    end
  end

  def flag
    return if revealedA
    @flagged ? @flagged = false : @flagged = true
  end

  def neighbors(board)

    adjacent_positions = []
    DELTA_POS.each { |delta| adjacent_positions << [delta[0] + @pos[0], delta[1] + @pos[1]] }
    # adjacent_positions << [@pos[0] - 1, @pos[1] - 1]
    # adjacent_positions << [@pos[0] - 1, @pos[1]]
    # adjacent_positions << [@pos[0] - 1, @pos[1] + 1]
    # adjacent_positions << [@pos[0], @pos[1] - 1]
    # adjacent_positions << [@pos[0], @pos[1] + 1]
    # adjacent_positions << [@pos[0] + 1, @pos[1] - 1]
    # adjacent_positions << [@pos[0] + 1, @pos[1]]
    # adjacent_positions << [@pos[0] + 1, @pos[1] + 1]

    adjacent_positions.select! do |pos|
      pos[0].between?(0,board.grid.length - 1) && pos[1].between?(0,board.grid.length - 1)
    end
    #create array of adjacent tiles
    #new tiles for each neighbor

    adjacent_positions.each do |position|
      @neighbors << board[position]
    end
  end

  def neighbor_bomb_count
    #reveals adjacent tiles, counts bombs
    @neighbor_bomb_count = 0
    @neighbors.each do |tile|
      @neighbor_bomb_count += 1 if tile.bombed
    end
  end

  def value
    return "F" if flagged
    if revealed
      return "*" if @bombed
      return @neighbor_bomb_count.to_s
    else
      return "-"
    end
  end

  def bombed?
    return nil unless self.revealed
    bombed
  end
end

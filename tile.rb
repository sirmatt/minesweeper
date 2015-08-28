class MinesweeperTile
  attr_reader :flagged, :revealed

  def initialize(bombed)
    @bombed = bombed
    @flagged = false
    @revealed = false
    @neighbors = []
    @neighbor_bomb_count = 0
  end

  def reveal
    #set reveal to true, return neighbor_bomb count, or blow you up if bomb
  end

  def neighbors
    #create array of adjacent tiles
  end

  def neighbor_bomb_count
    #reveals adjacent tiles, counts bombs
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
end

require_relative "board.rb"

class MinesweeperGame
  def initialize(size,bombs)
    @board = Board.new(size,bombs)
  end

  def run
    until @board.game_over?
      @board.render
      pos, move_type = prompt
      if move_type == :f
        @board[pos].flag
      elsif @board[pos].reveal(@board) == :boom
        puts "you lost the game."
      end
    end

    if @board.board_won?
      puts "You win!"
    end
    @board.render
    # until board.game_over?
    #   get flag or reveal and position
    #   flag position or reveal it
    #     if board.all (revealed or flagged && no false_flags
    #       win
  end

end

def prompt
  #asks user for a move_type and position(as 1 array with row,col)

  while true
    puts "To reveal a square, enter a position as [row],[column]"
    puts "To flag/unflag a mine, enter f,[row],[column]"
    position_move = gets.chomp.split(",")
    if position_move.length == 2
      return position_move.map { |move| move.strip.to_i }, :r
    elsif position_move.length == 3
      return  position_move.drop(1).map { |move| move.strip.to_i }, :f
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  a = MinesweeperGame.new(9,10).run
end

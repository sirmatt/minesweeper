require_relative "board.rb"

class MinesweeperGame
  def initialize
    @board = Board.new
  end

  def run
    until @board.game_over?
      @board.render
      pos, move_type = prompt
      case move_type
      when :flag
        @board[pos].flag
      when :unflag
        @board[pos].unflag
      when :reveal
        @board[pos].reveal
      end
    end
    #until board.game_over?
      #get flag or reveal and position
      #flag position or reveal it
        #if board.all (revealed or flagged && no false_flags
          #win
  end

end

def prompt
  #asks user for a move_type and position(as 1 array with row,col)
end

if __FILE__ == $PROGRAM_NAME
  a = MinesweeperGame.new.run
end

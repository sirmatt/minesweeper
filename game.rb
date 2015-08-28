require_relative "board.rb"

class MinesweeperGame
  def initialize(size,bombs)
    @board = Board.new(size,bombs)
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
        if @board[pos].reveal(@board) == :boom
          puts "you lost the game."
          @board.render
        end
      end
    end
    if @board.board_won?
      puts "You win!"
      @board.render
    end
    # until board.game_over?
    #   get flag or reveal and position
    #   flag position or reveal it
    #     if board.all (revealed or flagged && no false_flags
    #       win
  end

end

def prompt
  move_type = ""
  #asks user for a move_type and position(as 1 array with row,col)
  until move_type.is_a?(Symbol)
    puts "Hey yo! Type in a move type (f= flag,u= unflag,r= reveal)"
    move_type = gets.chomp
    case move_type
    when "f"
      move_type = :flag
    when "u"
      move_type = :unflag
    when "r"
      move_type = :reveal
    end
  end
  while true
    puts "Put in a position on the grid. Like this: row, column"
    position_move = gets.chomp.split(",")
    if position_move.length == 2
      return position_move.map { |move| move.strip.to_i }, move_type
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  a = MinesweeperGame.new(3,1).run
end

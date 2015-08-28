require_relative "board.rb"

class MinesweeperGame
  def initialize
    @board = Board.new
  end

  def run
    until @board.game_over?
      @board.render
      pos, move_type = prompt
      p pos
      p move_type
      break
      case move_type
      when :flag
        @board[pos].flag
      when :unflag
        @board[pos].unflag
      when :reveal
        @board[pos].reveal
      end
    end
    # until board.game_over?
    #   get flag or reveal and position
    #   flag position or reveal it
    #     if board.all (revealed or flagged && no false_flags
    #       win
  end

end

def prompt
  #asks user for a move_type and position(as 1 array with row,col)
  puts "Hey yo! Type in a move and also a move type (flag, unflag, reveal)"
  move_type = gets.chomp
  case move_type
  when "flag"
    move_type = :flag
  when "unflag"
    move_type = :unflag
  when "reveal"
    move_type = :reveal
  end

  puts "Put in a position on the grid. Like this: row, column"
  position_move = gets.chomp.split(",")
  return position_move.map { |move| move.strip.to_i }, move_type
end

if __FILE__ == $PROGRAM_NAME
  a = MinesweeperGame.new.run
end

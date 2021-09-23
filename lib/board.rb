
class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def render
    board.each do |cell|
      if [3, 6].include?(cell)
        print " #{board[cell - 1]} |\n"
        puts '---+---+---+'
      else
        print " #{board[cell - 1]} |"
      end
    end
    puts "\n"
  end
end

test = Board.new
test.render

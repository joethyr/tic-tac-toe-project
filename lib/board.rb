# frozen_string_literal: true

# Maintains board state
class Board
  attr_accessor :board, :cell

  def initialize
    @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def winning_choices
    [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end

  def render
    puts <<-SHOW
  #{cell[0]} | #{cell[1]} | #{cell[2]}
 ---+---+---
  #{cell[3]} | #{cell[4]} | #{cell[5]}
 ---+---+---
  #{cell[6]} | #{cell[7]} | #{cell[8]}
    SHOW
  end
end

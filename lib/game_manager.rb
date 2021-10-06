# frozen_string_literal: true

# Manages the gameplay
class GameManager
  attr_accessor :player1, :player2, :current_player, :board

  def initialize(options)
    @player1 = options[:player1]
    @player2 = options[:player2]
    @current_player = player1
    @board = Board.new
  end

  def winning_choices
    [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end
end

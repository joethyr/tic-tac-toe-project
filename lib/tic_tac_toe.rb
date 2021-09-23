# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Controls the gamplay
class TicTacToe
  attr_accessor :player1, :player2

  def initialize(options)
    options = defaults.merge(options)

    @board = Board.new
    @player1 = options[:player1]
    @player2 = options[:player2]
  end

  def defaults
    { player1: Player.new('Player 1', 'X'),
      player2: Player.new('Player 2', 'O') }
  end

play
  loop inifinitely
    call the board display method
    ask current player what board cell to take
    break loop if current player has won
    switch players



end

play = TicTacToe.new(player1: Player.new('Joe', 'J'), player2: Player.new('Bob', 'B'))
play
# Set up the game initially [tictactoe]
#   Create a game board [board]
#   Create a couple players [player]

# Start the game loop [tictactoe]
#   Display the board [board]
#   Ask for and validate the current player's move [player]
#   If the game should end [tictactoe]
#     Display the proper victory / draw prompt
#     Stop looping
#   Else
#     Switch to the next player and keep looping [tictactoe]

# frozen_string_literal: true

require_relative 'board'
require_relative 'game_manager'
require_relative 'game_prompt'
require_relative 'game_state'
require_relative 'game_validate_moves'
require_relative 'player_choices'
require_relative 'player'

game = GameManager.new(
  player1: Player.new('Joe', 'X'),
  player2: Player.new('Bill', 'O')
)

game.board.render

# Set up the game initially(game manager) X
#     Create a game board (board) X
#     Create a couple players (board) X
# Introduction (prompt) X
# Start the game loop (game manager)
    # a players turn (game manager)
#     notify whose turn it is (prompt)
#     Render the board (board)
#     Ask the current player what position theyll take (player choice)
    #   notify what position has been taken (game validate moves)
    #   render the board (board)
    # end of players turn
    # switch players (game manager)
    # a players turn
#     check if player has won( game state)
#         Display the proper victory / draw message
#         Stop looping
#     Else
#         Switch to the next player and keep looping

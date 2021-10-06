# frozen_string_literal: true

require_relative 'game_prompt'
# Manages the gameplay
class GameManager
  attr_accessor :player1, :player2, :current_player, :board

  def initialize
    @player1 = Player.new('Joe', 'X')
    @player2 = Player.new('Bill', 'O')
    @current_player = player1
    @board = Board.new
  end

  def game_prompt
    GamePrompt.new
  end

  def winning_choices
    [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end

  def play
    game_prompt.introduction(player1.name, player2.name)
    game_prompt.starting_player(current_player.name)
    game_prompt.player_turn(current_player.name)
    board.render
    game_prompt.ask_choice_prompt
  end
end

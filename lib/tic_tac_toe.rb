# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'prompts'

# Controls the gamplay
class TicTacToe
  include Prompts
  attr_accessor :player1, :player2, :current_player, :board
  def initialize(options)
    options = defaults.merge(options)

    @player1 = options[:player1]
    @player2 = options[:player2]
    @current_player = player1
    @board = Board.new
  end

  def defaults
    { player1: Player.new('Player 1', 'X'),
      player2: Player.new('Player 2', 'O') }
  end

  def player_choice
    choice = gets.chomp.to_i
    position_taken(choice) || check_position(choice)
  end

  def ask_choice
    board.render
    ask_choice_prompt
    player_choice
  end

  def check_position(choice)
    if (1..9).to_a.any? { |e| e == choice }
      puts "#{current_player.name}, you have taken the ##{choice} spot."
      valid_position_prompt
      current_player.choices << choice
      update
      true
    else
      invalid_position_prompt
      ask_choice
    end
  end

  def position_taken(choice)
    if board.cell[choice - 1].is_a? String
      position_taken_prompt
      ask_choice
    else
      false
    end
  end

  def update
    board.cell[current_player.choices.last - 1] = current_player.symbol
    board.render
  end

  def switch_players
    if @current_player == player1
      @current_player = player2
    else
      @current_player = player1
    end
  end

  def turn
    player_turn
    ask_choice
  end

  def play
    introduction
    loop do
      turn
      break if game_over

      switch_players
    end
    play_again
  end

  def check_won
    if board.winning_choices.any? { |row| (row - current_player.choices).empty? }
      check_won_prompt
      true
    else
      false
    end
  end

  def check_tie
    if board.cell.all? { |x| x.is_a? String }
      check_tie_prompt
      true
    else
      false
    end
  end

  def game_over
    check_won || check_tie
  end

  def play_again
    play_again_prompt
    answer = gets.chomp.upcase
    case answer
    when "YES", "Y"
      play
    when "NO", "N"
      end_game_prompt
      exit
    else
      invalid_play_again_prompt
      play_again
    end
  end
end

game = TicTacToe.new(player1: Player.new('Joe', 'J'), player2: Player.new('Bob', 'B'))
game.play

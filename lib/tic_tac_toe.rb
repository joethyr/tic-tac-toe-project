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
    print '>'
    choice = gets.chomp.to_i
    puts "#{current_player.name}, you have taken the ##{choice} spot."
    puts "--------------------------------"
    current_player.choices << choice
    update
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
    player_choice
  end

  def winning_choices
    board.winning_choices
  end

  def play
    loop do
      turn
      break if game_over
      switch_players
    end
  end

  def check_won
    if game_won?
      puts "#{current_player.name} you have won the game!"
      true
    else
      false
    end
  end

  def check_tie
    if game_tie?
      puts "Woah! Looks like the game has come to a draw!"
      true
    else
      false
    end
  end

  def game_over
    check_won || check_tie
  end

  def game_won?
    winning_choices.any? { |row| (row - current_player.choices).empty? }
  end

  def game_tie?
    board.cell.all? { |x| x.is_a? String }
  end
end

game = TicTacToe.new(player1: Player.new('Joe', 'J'), player2: Player.new('Bob', 'B'))
game.introduction
game.play

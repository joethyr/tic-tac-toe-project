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
      if check_won? == true
        puts "#{current_player.name} you have won the game!"
        break
      end
      switch_players
    end
  end

  def check_won?
    winning_choices.any? { |row| (row - current_player.choices).empty? }
  end
end

game = TicTacToe.new(player1: Player.new('Joe', 'J'), player2: Player.new('Bob', 'B'))
game.introduction
game.play

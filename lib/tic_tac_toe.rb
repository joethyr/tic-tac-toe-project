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
    if board.cell[choice - 1].is_a? String
      puts "that number has already been taken"
      return ask_choice
    elsif (1..9).to_a.any? { |e| e == choice }
      puts "#{current_player.name}, you have taken the ##{choice} spot."
      puts "--------------------------------"
      current_player.choices << choice
      update
    else
      puts "the number entered is not correct."
      return ask_choice
    end
  end

  def valid_num(choice)
    (1..9).to_a.any? { |e| e == choice }
  end

  def num_taken(choice)
    board.cell[choice - 1].is_a? String
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

  def play_again
    puts "Would you like to play another game?\nY or N?"
    print ">"
    answer = gets.chomp.upcase
    if answer == "YES" || answer == "Y"
      return play
    elsif answer == "NO" || answer == "N"
      puts "goodbye!"
      exit
    else
      puts "please enter yes or no."
      return play_again
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
    board.winning_choices.any? { |row| (row - current_player.choices).empty? }
  end

  def game_tie?
    board.cell.all? { |x| x.is_a? String }
  end
end

game = TicTacToe.new(player1: Player.new('Joe', 'J'), player2: Player.new('Bob', 'B'))
game.play

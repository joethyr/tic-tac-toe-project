# frozen_string_literal: true

# maintains the CLI game prompts
class GamePrompt
  def introduction(player1, player2)
    puts "Hi #{player1} and #{player2}!"
    puts "Let's play a game of Tic-Tac-Toe!"
  end

  def starting_player(current_player)
    puts "#{current_player}, you go first!"
  end

  def player_turn(current_player)
    puts "\n#{current_player}, its your turn!"
  end

  def ask_choice_prompt
    puts "Which cell will you take?"
    print '>'
  end

end

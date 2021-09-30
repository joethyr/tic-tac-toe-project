module Prompts
  def introduction
    puts "Hi #{player1.name} and #{player2.name}!"
    puts "Let's play a game of Tic-Tac-Toe!"
    puts "#{current_player.name}, you go first!"
  end

  # ask what cell the player chooses
  def ask_choice_prompt
    puts "Which cell will you take?"
    print '>'
  end

  def player_turn
    puts "\n#{current_player.name}, its your turn!"
  end

  def valid_position_prompt
    puts "--------------------------------"
  end

  def invalid_position_prompt
    puts "the number entered is not correct."
  end

  def position_taken_prompt
    puts "that number has already been taken"
  end

  def check_won_prompt
    puts "#{current_player.name} you have won the game!"
  end

  def check_tie_prompt
    puts "Woah! Looks like the game has come to a draw!"
  end

  def play_again_prompt
    puts "Would you like to play another game?\nY or N?"
    print ">"
  end

  def end_game_prompt
    puts "Goodbye!"
  end

  def invalid_play_again_prompt
    puts "please enter yes or no."
  end
end

module Prompts
  def introduction
    puts "Hi #{player1.name} and #{player2.name}!"
    puts "Let's play a game of Tic-Tac-Toe!"
    puts "#{current_player.name}, you go first!"
  end

  # ask what cell the player chooses
  def ask_choice
    board.render
    puts "Which cell will you take?"
  end

  def player_turn
    puts "#{current_player.name}, its your turn!"
  end


end

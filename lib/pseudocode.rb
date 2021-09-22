# 2. Psuedocode the High level Approach

# Set up the game initially
#   Create a game board
#   Create a couple players

# Start the game loop
#   Display the board
#   Ask for and validate the current player's move
#   If the game should end
#     Display the proper victory / draw prompt
#     Stop looping
#   Else
#     Switch to the next player and keep looping

# A high level pseudocoding will cover the major actions

# 3. Assign Actions to Objects

# Assigning actions to object to help clarify which objects are really classes and who should own what.
# Delegate as many actions to an appropriate object as possible instead of keeping them all contained within a god class.
# Break out the pseudocode into more details and assign the owner to each action.

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

# Based on the info above, there are 3 classes:
# - TicTacToe (controls the gameplay)
# - Board (keeps the board state and renders it)
# - Player (create each player)

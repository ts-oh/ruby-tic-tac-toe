require 'pry-byebug'
require_relative 'board'
require_relative 'display'
require_relative 'player'

include Display

welcome_message

# game grid creation
game_grid = Board.new

# player1 creation
player1 = Player.new
welcome_players(player1)

# player2 creation
player2 = Player.new
welcome_players(player2)

press_any_key

# start game turn
turn(game_grid, player1, player2)

# Create a game board in the command line.
# Initialize player 1 and player 2
# Choose the symbols by each player "x" or "o"
# Initialize the game

# Board class intialize a new board 3x3 grid

class Board
  attr_accessor :grid
  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
    puts "\n"
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts '-----------'
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts '-----------'
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    puts "\n"
  end

end

game_board = Board.new
puts game_board
puts game_board.grid[2]

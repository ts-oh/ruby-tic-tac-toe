require 'io/console'
system('clear')

def welcome_message
	print "Tic-Tac-Toe Game \n\n\n"
	print "Rules: \n\n"
	print "1. Two players, X and O take turns filling in 3x3 grid spaces  \n"
	print "2. The first player who places 3-marks wins 💪 \n"
	print "3. Marks must be either horizontal, vertical, or diagonal ← → ↑ ↓ ↖ ↘ \n\n\n"
	print "Press any key to continue... 😎"
  STDIN.getch
  system('clear')
end

def press_any_key
  print 'Press any key to start Tic-Tac-Toe!'
  STDIN.getch
  system('clear')
end

welcome_message

# 1. Create a class that creates player objects (name and symbol)
class Player
  @@player_count = 0
  def initialize
    if @@player_count == 0
      @@player_count += 1
      @symbol = 'X'
      print 'Player 1 Please enter your name: '
      @name = gets.chomp.capitalize
    elsif @@player_count == 1
      @symbol = 'O'
      print 'Player 2 Please enter your name: '
      @name = gets.chomp.capitalize

    end
  end

  def display_players
    puts "\n Hello #{@name}! You are '#{@symbol}'"
  end
end

new_player1 = Player.new
puts new_player1.display_players

new_player2 = Player.new
puts new_player2.display_players

press_any_key

# 2. Create a class that creates game board grid (3x3) object
class Board
  attr_accessor :grid
  def create_grid
    @grid = %w[1 2 3 4 5 6 7 8 9]
    puts "\n"
    puts "#{@grid[0]} | #{@grid[1]} | #{@grid[2]}"
    puts '-----------'
    puts "#{@grid[3]} | #{@grid[4]} | #{@grid[5]}"
    puts '-----------'
    puts "#{@grid[6]} | #{@grid[7]} | #{@grid[8]}"
    puts "\n"
  end
	
  def print_game_grid
    create_grid
  end
end

game_board = Board.new
puts game_board.print_game_grid

# 3. Start Game
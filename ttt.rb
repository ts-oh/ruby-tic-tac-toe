require 'pry-byebug'
require 'io/console'

# Clear command line display to start game
system('clear')

# Method to display a welcome message with rules
def welcome_message
  print "Tic-Tac-Toe Game \n\n\n"
  print "Rules: \n\n"
  print "1. Two players, X and O take turns filling in 3x3 grid spaces  \n"
  print "2. The first player who places 3-marks wins\n"
  print "3. Marks must be either horizontal, vertical, or diagonal \n\n\n"
  print 'Press any key to continue...'
  STDIN.getch
  system('clear')
end

# Method to display message to start game after name is set
def press_any_key
  print 'If you are ready, press any key to start Tic-Tac-Toe!'
  STDIN.getch
  system('clear')
end

# Display welcome message method
welcome_message

# Class that creates player objects with name and mark
class Player
  # @name and @mark should be readable anywhere
  attr_reader :name, :mark

  # intialize name and mark for new players
  # first player mark is always "X" and second player always "O"
  @@player_count = 0
  def initialize
    if @@player_count == 0
      @@player_count += 1
      @mark = 'X'
      print 'Player 1 Please enter your name: '
      @name = gets.strip.capitalize
    elsif @@player_count == 1
      @mark = 'O'
      print 'Player 2 Please enter your name: '
      @name = gets.strip.capitalize

    end
  end

  # method to greet player and display their name and mark
  def welcome_players
    puts "\n Hello #{@name}! You are '#{@mark}'"
  end
end

# Create player 1 object
player1 = Player.new
# Display player 1 name and their mark
puts player1.welcome_players

# Create player 2 object
player2 = Player.new
# Display player 2 name and their mark
puts player2.welcome_players

# Display message to start game
press_any_key

# Game grid object creating class
class Board
  # grid array should be readable and writable
  attr_accessor :grid

  # grid is always intialized with 3x3 squares
  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
  end

  # method to display the tic-tac-toe grid
  def display_grid
    puts "\n"
    puts "#{@grid[0]} | #{@grid[1]} | #{@grid[2]}"
    puts '---------'
    puts "#{@grid[3]} | #{@grid[4]} | #{@grid[5]}"
    puts '---------'
    puts "#{@grid[6]} | #{@grid[7]} | #{@grid[8]}"
    puts "\n"
  end
end

# Create a new grid object to play tic-tac-toe
game_grid = Board.new

def check_draw?(game_grid)
  game_grid.grid.all?{|grid| grid == 'X' || grid =='O'}
end

# Method to check for valid move
def valid_move?(player_position, game_grid)
  # if gamegrid index is filled with 'X' or 'O'
  if game_grid.grid[player_position.to_i - 1] == 'X' || game_grid.grid[player_position.to_i - 1] == 'O'
    false
  else
    true
  end
end

# Create a way to have player place their mark on the board
def turn(game_grid, player1, player2)
  puts game_grid.display_grid
  # player counter is zero
  counter = 0

  # if player1 counter is even (true), then place mark
  loop do
    if counter.even?
      puts "#{player1.name}'s turn!"
      player_position = gets.strip
      if valid_move?(player_position, game_grid) == true
          game_grid.grid[player_position.to_i - 1] = player1.mark
          counter += 1
          system('clear')
          puts game_grid.display_grid
          if check_draw?(game_grid) == true
            return puts "it's a draw!"
          end
        end
    # if player 1 is not even (false) then, player 2 turn and place mark
    else
      puts "#{player2.name}'s turn!"
      player_position = gets.strip
      if valid_move?(player_position, game_grid) == true
        game_grid.grid[player_position.to_i - 1] = player2.mark
        counter += 1
        system('clear')
        puts game_grid.display_grid
        if check_draw?(game_grid) == true
          return puts "it's a draw!"
        end
      end
    end
  end
end

turn(game_grid, player1, player2)



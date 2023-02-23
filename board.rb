require_relative 'player'
require_relative 'display'
require 'colorize'

class Board
  attr_accessor :grid

  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
    @player_position = nil
  end

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

WIN_INDEX = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

def check_win?(game_grid)
  WIN_INDEX.detect do |i|
    if game_grid.grid[i[0]] == 'X'.green && game_grid.grid[i[1]] == 'X'.green && game_grid.grid[i[2]] == 'X'.green || game_grid.grid[i[0]] == 'O'.red && game_grid.grid[i[1]] == 'O'.red && game_grid.grid[i[2]] == 'O'.red
      return true
    end
  end
end

def check_draw?(game_grid)
  game_grid.grid.all? { |grid| grid == 'X'.green || grid == 'O'.red }
end

def valid_move?(player_position, game_grid)
  if game_grid.grid[player_position - 1] == 'X'.green || game_grid.grid[player_position - 1] == 'O'.red
    false
  else
    true
  end
end

def check_valid_input
  @player_position = gets.strip.to_i
  unless @player_position.between?(0, 10)
    puts 'please enter valid number between 1-9: '.light_magenta
    @player_position = gets.strip.to_i
  end
end

def play_again
  play_again_display()
  again_input = gets.strip
  if again_input == "y"
    clear_screen()
    main()
  elsif again_input == "n"
    print "\n"
    print "Good Bye! 👋\n".red
    return print "\n"
  else
    play_again()
  end
end

def turn(game_grid, player1, player2)
  puts game_grid.display_grid
  counter = 0

  loop do
    current_player = counter.even? ? player1 : player2
    player_turn(current_player.name)
    check_valid_input

    if valid_move?(@player_position, game_grid)
      game_grid.grid[@player_position - 1] = current_player.mark
      counter += 1
      clear_screen()
      puts game_grid.display_grid

      if check_win?(game_grid)
        winner(current_player.name)
        return play_again()
      elsif check_draw?(game_grid)
        draw_message
        return play_again()
      end
    end
  end
end

require_relative 'player'
require_relative 'display'
require 'pry-byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
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
    if game_grid.grid[i[0]] == 'X' && game_grid.grid[i[1]] == 'X' && game_grid.grid[i[2]] == 'X' || game_grid.grid[i[0]] == 'O' && game_grid.grid[i[1]] == 'O' && game_grid.grid[i[2]] == 'O'
      return true
    end
  end
end

def check_draw?(game_grid)
  game_grid.grid.all? { |grid| grid == 'X' || grid =='O' }
end

def valid_move?(player_position, game_grid)
  if game_grid.grid[player_position.to_i - 1] == 'X' || game_grid.grid[player_position.to_i - 1] == 'O'
    false
  else
    true
  end
end

def turn(game_grid, player1, player2)
  puts game_grid.display_grid
  counter = 0
  loop do
    if counter.even?
      puts "#{player1.name}'s turn!"
      player_position = gets.strip
      if valid_move?(player_position, game_grid) == true
        game_grid.grid[player_position.to_i - 1] = player1.mark
        counter += 1
        system('clear')
        puts game_grid.display_grid
        if check_win?(game_grid) == true
          return puts "#{player1.name} is the winner!"
        elsif check_draw?(game_grid) == true
          return puts "it's a draw!"
        end
      end
    else
      puts "#{player2.name}'s turn!"
      player_position = gets.strip
      if valid_move?(player_position, game_grid) == true
        game_grid.grid[player_position.to_i - 1] = player2.mark
        counter += 1
        system('clear')
        puts game_grid.display_grid
        if check_win?(game_grid) == true
          return puts "#{player2.name} is the winner!"
        elsif check_draw?(game_grid) == true
          return puts "it's a draw!"
        end
      end
    end
  end
end

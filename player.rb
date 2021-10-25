require_relative 'display.rb'
require 'pry-byebug'

class Player
	include Display
  attr_reader :name, :mark
  @@player_count = 0

  def initialize
    case @@player_count
    when 0
      @@player_count += 1
      @mark = 'X'
			print "Player 1, enter your name: "		
      @name = gets.strip.capitalize
    when 1
      @mark = 'O'
      print "Player 2, enter your name: "
      @name = gets.strip.capitalize
    end
  end
end
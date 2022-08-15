require_relative 'display'
require 'colorize'

class Player
  include Display
  attr_reader :name, :mark

  @@player_count = 0

  def initialize
    case @@player_count
    when 0
      @@player_count += 1
      @mark = 'X'.green
      print "Player 1, enter your name: ".green
      @name = gets.strip
      print "\n"
      name_check

    when 1
      @mark = 'O'.red
      print "Player 2, enter your name: ".red
      @name = gets.strip
      print "\n"
      name_check
			@@player_count = 0
    end
  end

  def name_check
    loop do
      if @name == ''
        print "Your name can not be empty! \n\n".light_magenta
        print "Please enter your name again: ".light_cyan
        @name = gets.strip
        print "\n"
      end
      break unless @name.empty?
    end
  end
end

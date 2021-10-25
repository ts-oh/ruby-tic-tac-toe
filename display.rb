require_relative 'player.rb'
require 'io/console'
require 'pry-byebug'

system('clear')

module Display
  def welcome_message
    print "Tic-Tac-Toe Game \n\n\n"
    print "Rules: \n\n"
    print "1. Two players, X and O take turns filling in 3x3 grid spaces  \n"
    print "2. The first player who places 3-marks wins\n"
    print "3. Marks must be either horizontal, vertical, or diagonal \n\n\n"
    print 'Press any key to continue...'
    $stdin.getch
    system('clear')
  end

  def press_any_key
    print 'If you are ready, press any key to start Tic-Tac-Toe!'
    $stdin.getch
    system('clear')
  end

  def welcome_players(player)
		puts "\nHello #{player.name}! You are '#{player.mark}'"
		puts "\n\n"
	end
end

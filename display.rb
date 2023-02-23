require_relative 'player'
require 'io/console'
require 'colorize'
require 'colorized_string'

module Display
  
  def welcome_message
    clear_screen()   
    ColorizedString.colors
    print("Hello! 🤗 \n\n\n")
    puts <<-'EOF'
     _______ _        _______           _______
    |__   __(_)      |__   __|         |__   __|
       | |   _  ___     | | __ _  ___     | | ___   ___
       | |  | |/ __|    | |/ _` |/ __|    | |/ _ \ / _ \
       | |  | | (__     | | (_| | (__     | | (_) |  __/
       |_|  |_|\___|    |_|\__,_|\___|    |_|\___/ \___|
    
    EOF
    
    print "\n"
    print "Rules: \n\n".light_yellow
    print "1. Two players, X and O take turns filling in 3x3 grid spaces. \n"
    print "2. The first player who places 3-marks wins! \n"
    print "3. Marks must be either horizontal, vertical, or diagonal. \n\n\n"
    print "Press any key to continue...".red
    $stdin.getch
    clear_screen()
  end

  def press_any_key
    print "If you are ready, press any key to start Tic-Tac-Toe! \n".yellow
    $stdin.getch
    clear_screen()
  end

  def welcome_players(player)
    print "Hello #{player.name}! You are '#{player.mark}'"
    print "\n\n\n"
  end

  def winner(player)
    print "#{player} is the winner! \n\n".magenta
  end

  def player_turn(player)
      print "#{player}'s turn!: "
  end

  def draw_message
    print "The game is a draw! \n\n\n".magenta
  end

  def play_again_display
    print "Would you like to play again? enter 'y'[Yes] or 'n'[No]: ".cyan
  end

  def clear_screen()
    system('clear')
  end

end

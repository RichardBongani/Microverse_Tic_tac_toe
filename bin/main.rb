#!/usr/bin/env ruby

require_relative '../lib/tic_tac_toe.rb'
require_relative '../lib/player.rb'

class Main
  def initialize
    @play = TicTacToe.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
    @board = [0,1,2,3,4,5,6,7,8]
  end

  def array
    @board 
  end

  def board(board)
    puts "\n"
    puts "#{board[0]}  |#{board[1]} |#{board[2]}"
    puts '---------'
    puts "#{board[3]}  |#{board[4]} |#{board[5]}"
    puts '---------'
    puts "#{board[6]}  |#{board[7]} |#{board[8]}"
    puts "\n"
  end

  def welcome_message
    puts "\n"
    puts 'Welcome to TicTacToe!'
    puts 'Player one starts playing'
    puts 'To win you need to have three identical symbols in a row, or column or diagonal'
    puts "\n"
  end

  def players_info
    while true
      print "Player 1 choose a symbol \"X\" or \"O\" "
      @symbol = gets.chomp.capitalize
      break if @symbol == "X" || @symbol == "O"
      puts " Player 1 a valid symbol:"
    end
    @player_1 = Player.new(@symbol)
    # symbol = @symbol
    if @symbol == "X"
      symbol = "O"
    else
      symbol = "X"
    end
    @player_2 = Player.new(symbol)
  end

  def start_playing
    game_on = true
    @play.board
    count = 1
    while game_on || game_on.nil?
      if count.odd?
        puts "It's Player 1's turn"
        print 'Pick a position between 0-8: '
        position = gets.chomp.to_i
        symbol = @board[position] = @player_1.symbol
        game_on = @play.play_game(position, @player_1.symbol,"Player 1" )
      else
        puts "It's Player 2's turn"
        print 'Pick a position between 0-8: '
        position = gets.chomp.to_i
        symbol = @board[position] = @player_2.symbol
        game_on = @play.play_game(position, @player_2.symbol,"Player 2")
      end
      count += 1
      next if (game_on == false) || (game_on == 'Invalid')

      @board[position] = symbol
      # draw_board(@board)
      board(@board)
      
    end
  end
end

game = Main.new
game.welcome_message
game.players_info
game.start_playing

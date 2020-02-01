class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    counter = 0
    while counter <= 6
      puts " #{@board[counter]} | #{@board[counter + 1]} | #{@board[counter + 2]} "
      counter < 6 ? (puts "-----------") : ()

      counter += 3
    end

  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, player_symbol)
    @board[position] = player_symbol
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    if position_taken?(position) || (position < 0 || position > 8)
      return false
    end
    return true
  end
  
  def turn_count
    count = 0
    @board.each{|position|
      if position != " "
        count += 1
      end
    }
    count
  end
  
  def current_player
    (turn_count % 2 == 0)? "X" : "O" 
  end
  
  def turn 
    puts "Please enter 1-9:"
    user_input_raw = gets.chomp
    user_input = input_to_index(user_input_raw)
    if valid_move?(user_input) == true
      move(user_input, current_player)
      display_board
    else
      #turn
      puts "Something went wrong"
    end
  end
end


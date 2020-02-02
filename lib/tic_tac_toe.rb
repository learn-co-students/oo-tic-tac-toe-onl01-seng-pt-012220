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

  def move(position, player_symbol = "X")
    @board[position] = player_symbol
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8)
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
    user_input = input_to_index(gets.chomp)
    if valid_move?(user_input) == true
      move(user_input, current_player)
      display_board
    else
      turn
      #puts "Something went wrong"
    end
  end

  def won?
    WIN_COMBINATIONS.each{|win_combination|
      if (((@board[win_combination[0]] == @board[win_combination[1]]) && (@board[win_combination[0]] == @board[win_combination[2]])) && @board[win_combination[0]] != " ")
        return win_combination
      end
    }
    false
  end

  def full?
    @board.each{|box|
      if box == " "
        return false
      end
    }
    true
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
     won? ? @board[won?[0]] : nil
  end

  def play
    while over? == false
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

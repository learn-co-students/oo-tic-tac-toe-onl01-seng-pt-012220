require 'pry'

class TicTacToe

  def initialize
    @board =  [" "," "," "," "," "," "," "," "," "]
  end



  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(i)
    (i).to_i - 1

  end

  def move(index, token = X)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    cp = current_player
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      puts "Invalid move, please try again"
      turn
    end

  end

  def turn_count
    @board.count{|token| token == "X" || token == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?(board)
   board.all? {|i| i == "X" || i == "O"}
  end

  def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end

  def full?
   if @board.all? {|i| i == "X" || i == "O"}
     return true
   end

  end

  def draw?
    !won? && full?
  end

  def over?
    if draw?
      return true
    elsif won?
      return true
    end
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end

  end

  def play
    puts "Please input desired space #"
    turn until over?
    if winner
      puts  "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end

  end

game = TicTacToe.new

end

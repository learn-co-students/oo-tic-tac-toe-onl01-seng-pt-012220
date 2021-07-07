require "pry"
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], #bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # left to right diagonal
    [2,4,6]  # right to left diagonal
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    ##translate user input to return array index
    ans = nil
    ans = num.to_i - 1
    ans
  end

  def move(place, token)
    @board[place] = token
  end
  def position_taken?(num)
    ans = nil
    if @board[num] == "X" || @board[num] == "O"
      ans = true
    else
      ans = false
    end
    ans
  end

  def valid_move?(num)
    ans = nil
    if num >= 0 && num < 9
        position_taken?(num) ? ans = false : ans = true
    else
      ans = false
    end

    ans
  end

  def turn
    puts "Please enter a number (1-9):"
    ans = gets.strip
    index = input_to_index(ans)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "Position taken. Please pick another."
      turn
    end
    display_board
  end

  def won?
    win_ans = false
    win_comb = nil
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == @board[combination[1]] && @board[combination[0]] == @board[combination[2]] && position_taken?(combination[0])
        win_ans = true
        win_comb = combination
      end
    end
    win_ans
    win_comb
  end

  def full?
    f = false
    @board.each do |ans|
      ans == "X" || ans == "O" ? f = true : f = false
    end
    f
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    #@board[won?[0]] == " " ? nil : @board[won?[0]]
    if won?
      @board[won?[0]]
    end
  end

  def play
    #play
    #continue_game = nil
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif winner
      puts "Congratulations #{winner}!"
    end
  #  binding.pry
  end

end
#

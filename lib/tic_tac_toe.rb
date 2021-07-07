class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  @board=[]
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end
 
 def input_to_index(move)
    move.to_i-1
 end
 
 def move(index, token="X")
   @board[index]=token
 end
 
 def position_taken?(index)
   if @board[index] == " "
     false 
   else
     true 
   end
   
 end
 
 def valid_move?(index)
  if position_taken?(index) || (index < 0 || index > 8)
    false
  else
    true
  end
 end
 
 def turn_count
   taken_spaces=@board.select do |space|
     space != " "
   end
   taken_spaces.size
 end
   
  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end
  
  def turn
    input = gets  
    index_value = input_to_index(input)
    if valid_move?(index_value)
      puts "index_value #{index_value}"
      move(index_value, current_player)
    else
      turn()
    end
    display_board()
  end
  
  def won?
    if WIN_COMBINATIONS.any? {|combo| combo.all?{|place| @board[place] =="X"} || combo.all?{|place| @board[place] =="O"}}
      WIN_COMBINATIONS.detect {|combo| combo.all?{|place| @board[place] =="X"} || combo.all?{|place| @board[place] =="O"}}
    else
      false
    end
  end
  
  def full?
    @board.none? {|place| place == " "}
  end
  
  def draw?
    if !won? && full?
      true
    else
      false
    end
  end
  
  def over?
    won? || draw? ? true : false
  end
  
  def winner
    if won?
      WIN_COMBINATIONS.detect {|combo| combo.all?{|place| @board[place] =="X"}} ? "X" : "O"
    end
  end
  
  

  def play
    while !over?
      turn()
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
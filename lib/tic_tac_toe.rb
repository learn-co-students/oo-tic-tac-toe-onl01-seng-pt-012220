class TicTacToe
   def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(space)
    space.to_i - 1
  end
  
  def move (index, token = "X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    @board[index] != " " ? true : false 
  end
    
    
  def valid_move?(index)
    @board[index] != nil && position_taken?(index) == false ? true : false
  end
  
  def turn 
    puts "Choose a number between 1-9."
    index = input_to_index(gets.chomp)
    
    if valid_move?(index) == true   
      move(index, current_player)
      display_board
    else
      turn 
    end
  end
    
    def turn_count
      count = 0 
      @board.each do |i|
        if i != " " 
          count += 1 
        else
        end
      end
      count
      end
      
      
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
      
      
    def won?
      x_array = []
      o_array = []
      @board.each do |i|
        if i == "X"
          x_array << i.index 
        elsif i == "O"
          o_array << i.index
        else
      end
    end
    if WIN_COMBINATIONS.include? x_array 
      x_array
    elsif  WIN_COMBINATIONS.include? o_array
      o_array
    else
      false 
  end
end
      
    
    
  
  
  
end
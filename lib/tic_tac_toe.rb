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
    index >= 0 && index <= 8 && position_taken?(index) == false ? true : false
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
      winner = nil
      WIN_COMBINATIONS.each do |combo|
        if combo.all?  {|win| @board[win] == "X"}
          winner = combo 
        elsif combo.all? {|win| @board[win] == "O"}
          winner = combo
        else
          winner
      end
    end
    winner 
  end
    
    def full?
      full = nil
      if @board.all? {|i| i == "X" || i == "O"}
          full = true
        else
          full = false
        end
      full
    end
      
  def draw?
    draw = nil
    if full? == true && won? == nil
      draw = true
    else
      draw = false
    end
    draw
  end
  
  def over?
    won? || draw?
  end
    
  def winner
    token = nil
    if won? != nil
     token = @board[won?[0]]
     token
   else
 end
 end
 
 def play 
  turn until over? 
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
  end
end

  
end
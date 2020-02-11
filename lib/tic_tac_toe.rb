class TicTacToe
  
  #initialize
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
 #win combinations
    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  
  #display_board
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #input_to_index
  def input_to_index(input)
    @index = input.to_i - 1
  end
  
  #move
  def move(index, token = "X")
    @board[index] = token
  
  end

  #position_taken
  def position_taken?(index)
    ((@board[index] == "X") || (@board[index] == "O"))
  end
  
  #valid_move
  def valid_move?(index)
    index.to_i.between?(0,8) && !position_taken?(index)
  end
  
  #current_player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  #turn_count 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  #turn 
  def turn
    puts "Choose between 1-9"
    index = input_to_index(gets.chomp)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  #won?
  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
    if combo.all? {|win| @board[win] == "X"}
      winner = combo
    elsif combo.all? {|win| @board[win] == "O"}
      winner = combo
    else
      winner
    end
  end
  winner
end
  
  #full?
  def full? 
    turn_count == 9
  end
  
  #draw ?
  def draw? 
    full? && !won?
  end
  
  #over?
  def over?
    won? || draw?
  end
  
  #winner
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  #play 
  def play
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
  end
end
  
end
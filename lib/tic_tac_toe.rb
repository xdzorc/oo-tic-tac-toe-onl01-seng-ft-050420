class TicTacToe
  attr_accessor :board
  def initialize(board =nil)
    @board =board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]
  
 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    
  end
  
  def input_to_index(num)
    num.to_i-1
  end
  
  # def move(i,token="X")
  #   if token=="X"
  #     @board[0]="X" 
  #   elsif token=="O"
  #     @board[4]="O"
  #   end
  # end
  
  def move(index, player = "X")
    @board[index] =player
  end

  
  def position_taken?(index)
     @board[index]==" " ? false : true
  end
  
  def valid_move?(position)
     position<=8 && position >=0 && @board[position]==" " ? true : false
  end
  
  def turn_count
    counter=0
    @board.each do|x|
      if !(x==" ")
        counter+=1
      end
    end
    counter
  end
  
  # def current_player
  #   # current_player =nil
  #   # if turn_count==2
  #   #   current_player="X"
  #   # elsif turn_count==3
  #   #   current_player="O"
  #   # end
  #   # current_player
 
  # end
  def current_player
    num_turns = turn_count
    if num_turns % 2 == 0
      player = "X"
    else
      player = "O"
    end
    player
  end
  
  def turn
    user_input = gets.chomp
    index = input_to_index(user_input)
   
    if valid_move?(index) 
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end


  def won?
    WIN_COMBINATIONS.each do |x|
      if (@board[x[0]]=="X"&&@board[x[1]]=="X"&&@board[x[2]]=="X") || (@board[x[0]]=="O"&&@board[x[1]]=="O"&&@board[x[2]]=="O")
         return x 
      end
    end
    false
  end
  
  def full?
     !(@board.include?(" ") )
      
  end
  
  def draw?
     !(won?)&&full?
  end
  
  def over?
    draw?||won?
  end
  
  def winner
    WIN_COMBINATIONS.each do |x|
      if @board[x[0]]=="X"&&@board[x[1]]=="X"&&@board[x[2]]=="X"
         return "X"
      elsif @board[x[0]]=="O"&&@board[x[1]]=="O"&&@board[x[2]]=="O"
         return "O"
      end
    end
    nil
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
    
  
end
class TicTacToe
  
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
  
  def initialize(board=nil)
    @board=board || Array.new(9," ")  
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    
    (input.to_i)-1
    
  end
  
  def move(index, token="X") 
    
    @board[index]=token
    
  end
  
  def position_taken?(index)
    
   @board[index]=="X"||@board[index]=="O"
    
  end
  
  def valid_move?(position)
    
    if position>=1 && position<=9 && @board[position]==" "
      return true
    else
      return false
    end
    
  end
  
  def turn
    puts "Enter the index select from 1-9"
    input=gets.strip
    index=input_to_index(input)
    if valid_move?(index)
      move(index)
      display_board
      
    else
     until valid_move?(index)
        puts "enter a valid move between 1-9"
          input=gets.strip
          index=input_to_index(input)
      end
      move(index)
      display_board
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
     @board[combo[0]]==@board[combo[1]]&&
     @board[combo[1]]==@board[combo[2]]&&
     !position_taken?(combo[0])
      
    end
  end
      
  
end
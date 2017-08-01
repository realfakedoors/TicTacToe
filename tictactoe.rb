# Command Line Tic-Tac-Toe Game
# created for the Odin Project's Ruby OOP section: 
# https://www.theodinproject.com/courses/ruby-programming/lessons/oop

class Board
  
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @b_s = {:TL => "1", :TC => "2", :TR => "3", :ML => "4", :MC => "5", :MR => "6", :BL => "7", :BC => "8", :BR => "9"}
  end
  
  private
  
  def victory
    lines = [[@b_s[:TL],@b_s[:TC],@b_s[:TR]], [@b_s[:ML],@b_s[:MC],@b_s[:MR]], [@b_s[:BL],@b_s[:BC],@b_s[:BR]],[@b_s[:TL],@b_s[:ML],@b_s[:BL]], [@b_s[:TC],@b_s[:MC],@b_s[:BC]], [@b_s[:TR],@b_s[:MR],@b_s[:BR]], [@b_s[:TL],@b_s[:MC],@b_s[:BR]], [@b_s[:TR],@b_s[:MC],@b_s[:BL]]]
    
    if lines.any? {|line| line == ["X","X","X"]}
      puts "#{@player_one} wins!"
      true
    elsif lines.any? {|line| line == ["O","O","O"]}
      puts "#{@player_two} wins!"
      true
    else
      false
    end
  end
  
  @current_mark = "X"
  
  def mark_square
    case @marked_square
      when "1" then @b_s[:TL] = @current_mark
      when "2" then @b_s[:TC] = @current_mark
      when "3" then @b_s[:TR] = @current_mark
      when "4" then @b_s[:ML] = @current_mark
      when "5" then @b_s[:MC] = @current_mark
      when "6" then @b_s[:MR] = @current_mark
      when "7" then @b_s[:BL] = @current_mark
      when "8" then @b_s[:BC] = @current_mark
      when "9" then @b_s[:BR] = @current_mark
      else
        puts "Invalid input, try again!"
    end
  end
        
  def display_board
    puts ""
    puts "             |   |"
    puts "           #{@b_s[:TL]} | #{@b_s[:TC]} | #{@b_s[:TR]}"
    puts "        -----|---|-----"
    puts "           #{@b_s[:ML]} | #{@b_s[:MC]} | #{@b_s[:MR]}"
    puts "        -----|---|-----"
    puts "           #{@b_s[:BL]} | #{@b_s[:BC]} | #{@b_s[:BR]}"
    puts "             |   |"
    puts ""
    puts "      #{@player_one}(X) vs. #{@player_two}(O)"
    puts ""
    puts ""
    puts "       Player #{@current_mark}'s turn!"
    puts "Enter a square number to place"
    puts "          your mark!"
  end
        
  public
  
  def play
    index = 0
    until victory
      if index % 2 == 0
        @current_mark = "X"
      elsif index % 2 != 0
        @current_mark = "O"
      end
      display_board
      @marked_square = gets.chomp
      mark_square
      if index == 8
        puts "Draw!"
        break
      end
      index +=1
    end
  end
end

puts "Enter a name for player X!"
px = gets.chomp
puts "Enter a name for player Y!"
py = gets.chomp
c = Board.new(px, py)
c.play
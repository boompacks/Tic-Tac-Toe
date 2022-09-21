class Player
  attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end


class TicTacToe
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @@board = {}
    @@spots_filled = 0
    10.times {|i| @@board[i] = i}
  end

  private
  def draw_table()
    @row = 0
    @index = 0
    3.times do
      puts " #{@@board[@index+1]} | #{@@board[@index+2]} | #{@@board[@index+3]} "
      @index += 3
      puts "---+---+---" if @row < 2
      @row += 1
    end
  end


  def won?(player)
    @index = 1
    # check horizontally
    3.times do
      if @@board[@index] == player.symbol && @@board[@index+1] == player.symbol && @@board[@index+2] == player.symbol
        return true
        break
      end
      @index += 3
    end
    # check vertically
    @index = 1
    3.times do
      if @@board[@index] == player.symbol && @@board[@index+3] == player.symbol && @@board[@index+6] == player.symbol
        return true
        break
      end
      @index += 1
    end
   

    # check obliquely
    @index = 3
    return true if @@board[@index] == player.symbol && @@board[@index+2] == player.symbol && @@board[@index+4] == player.symbol
       
    
    @index = 1
    return true if @@board[@index] == player.symbol && @@board[@index+4] == player.symbol && @@board[@index+8] == player.symbol

    return false
  end


  def get_next_move(player)
    p "#{player.name}, it's your turn. Choose one of the free spots"
    @legit_move = false

    loop do
      loop do
        @player_choice = gets.chomp.to_i
        break if @player_choice.between?(1, 9)
      end
      if @@board[@player_choice].is_a? Integer
        @@board[@player_choice] = player.symbol
        @legit_move = true
      else
        puts "Choose a valid move"
      end
      break if @legit_move == true
    end
    @@spots_filled += 1
  end


  def get_result(player1_result, player2_result, p1, p2)
    if @player1_result == false && @player2_result == false
      puts "Draw!"
    elsif @player1_result == true
      puts "Congratulations #{p1.name}, you won!"
    else
      puts "Congratulations #{p2.name}, you won!"
    end
  end

  public
  def play_game(player1, player2)
    @flag = true
    @player1_result = false
    @player2_result = false

    loop do 
      draw_table()
      @flag == true ? get_next_move(player1) : get_next_move(player2)
      @flag == true ? @player1_result = won?(player1) : @player2_result = won?(player2)
      @flag = (!@flag)
      break if @player1_result == true || @player2_result == true || @@spots_filled == 9
    end
    draw_table()
    get_result(@player1_result, @player2_result, player1, player2)
  end
end

p "Player1, insert your nickname"
player1_name = gets.chomp
p "Player2, insert your nickname"
player2_name = gets.chomp

loop do
  restart = ""
  player1 = Player.new(player1_name, "X")
  player2 = Player.new(player2_name, "O")
  game = TicTacToe.new(player1, player2)
  game.play_game(player1, player2)

  loop do
    p "Want to play another game? [y, n]"
    restart = gets.chomp
    break if ["y", "n"].include?(restart)
  end
  break if restart == "n"
end

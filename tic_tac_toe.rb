class Player
  attr_reader :name
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end


class TicTacToe
  @@board = {}
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
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

  def show_player_name(player)
    puts player.name
  end

  public
  def play_game()
    draw_table()
  end
end


player1 = Player.new("Franco", "X")
player2 = Player.new("Sergio", "O")
game = TicTacToe.new(player1, player2)
# game.show_player_name(player1)
game.play_game()

# farsi dare nome degli utenti e il simbolo che vogliono usare per giocare
# Il gioco deve andare avanti finché qualcuno non ha vinto, quindi si dovrebbe controllare ad ogni mossa (sicuramente con un metodo privato)
# Tra le funzioni sicuramente serve una che va avanti in maniera iterativa finché uno dei due utenti non ha vinto
# 

# 1 | 2 | 3
#---+---+---
# 4 | 5 | 6
#---+---+---
# 7 | 8 | 9

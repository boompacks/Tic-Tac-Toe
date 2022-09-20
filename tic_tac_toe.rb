class Player
  attr_reader :name
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end


class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def show_player_name(player)
    puts player.name
  end
end

game = Board.new(player1, player2)
player1 = Player.new("Franco", "X")
player2 = Player.new("Sergio", "O")
game.show_player_name(player1)

# farsi dare nome degli utenti e il simbolo che vogliono usare per giocare
# Il gioco deve andare avanti finché qualcuno non ha vinto, quindi si dovrebbe controllare ad ogni mossa (sicuramente con un metodo privato)
# Tra le funzioni sicuramente serve una che va avanti in maniera iterativa finché uno dei due utenti non ha vinto
# 
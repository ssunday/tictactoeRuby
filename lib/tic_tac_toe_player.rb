class TicTacToePlayer
  attr_reader :player_marker
  def initialize(marker)
    @player_marker = marker
  end

  def get_marker
    player_marker
  end

end

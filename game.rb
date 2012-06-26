class Game < Chingu::Window
  def initialize
    super
    self.input = { escape: :exit }
    push_game_state(Level)
  end
end

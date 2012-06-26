require 'bundler'
Bundler.setup

$LOAD_PATH << File.dirname(__FILE__)
require 'chingu'
require 'spaceship'
require 'level'
require 'enemy'

# Input
# :holding_left = 'every frame'
# :left = 'key down'
# :released_left = 'key up'

class Game < Chingu::Window
  def initialize
    super
    self.input = { escape: :exit }
    push_game_state(Level)
  end
end

Game.new.show

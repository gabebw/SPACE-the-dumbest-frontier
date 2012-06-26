require 'bundler'
Bundler.setup

$LOAD_PATH << File.dirname(__FILE__)
require 'chingu'
require 'spaceship'
require 'level'
require 'enemy'
require 'game'

# Input
# :holding_left = 'every frame'
# :left = 'key down'
# :released_left = 'key up'

Game.new.show

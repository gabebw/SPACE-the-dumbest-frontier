class Spaceship < Chingu::GameObject
  COLOR = Gosu::Color::RED
  SPEED = 10
  START_X = 200
  START_Y = 200

  has_trait :bounding_circle, debug: $DEBUG
  has_traits :collision_detection

  def initialize
    super
    self.x = START_X
    self.y = START_Y
    self.image = Gosu::Image["spaceship.bmp"]
    self.input = {
      holding_left: :move_left,
      holding_right: :move_right,
      holding_up: :move_up,
      holding_down: :move_down
    }
  end

  def update
    # wrap around the screen
    @x %= $window.width
    @y %= $window.height
  end

  private

  def move_left
    @x -= SPEED
  end

  def move_right
    @x += SPEED
  end

  def move_up
    @y -= SPEED
  end

  def move_down
    @y += SPEED
  end
end

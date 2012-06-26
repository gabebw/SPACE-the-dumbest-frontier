class Enemy < Chingu::GameObject
  has_trait :bounding_circle, debug: $DEBUG
  has_traits :collision_detection, :velocity

  SCORE = 5

  def initialize(options = {})
    super(zorder: 1)
    self.image = Gosu::Image["sprite.gif"]
    self.x = random_x
    self.y = random_y
    self.velocity_x = random_velocity
    self.velocity_y = random_velocity
    self.color = random_color
    # A cached bounding circle will not adapt to changes in size, but it will
    # follow objects X / Y Same is true for "cache_bounding_box".
    cache_bounding_circle
  end

  def update
    # wrap around the screen
    @x %= $window.width
    @y %= $window.height
  end

  def destroy
    super
    laser.play
  end

  private

  def random_color
    Gosu::Color.new(0xff000000).tap do |color|
      color.red = random_color_value
      color.green = random_color_value
      color.blue = random_color_value
    end
  end

  def random_color_value
    rand(255 - 40) + 40
  end

  def random_velocity
    rand(10)
  end

  def random_x
    rand * $window.width
  end

  def random_y
    rand * $window.height
  end

  def laser
    Gosu::Sound['laser.wav']
  end
end

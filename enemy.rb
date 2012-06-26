class Enemy < Chingu::GameObject
  has_trait :bounding_circle, debug: $DEBUG
  has_traits :collision_detection, :velocity

  def initialize(options = {})
    super(zorder: 1)
    self.image = Gosu::Image["sprite.gif"]
    self.x = rand * $window.width
    self.y = rand * $window.height
    self.velocity_x = rand(10)
    self.velocity_y = rand(10)
    self.color = random_color
    # A cached bounding circle will not adapt to changes in size, but it will follow objects X / Y
    # Same is true for "cache_bounding_box"
    #
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
      color.red = rand(255 - 40) + 40
      color.green = rand(255 - 40) + 40
      color.blue = rand(255 - 40) + 40
    end
  end

  def laser
    Gosu::Sound['laser.wav']
  end
end

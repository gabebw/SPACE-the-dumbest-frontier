class Level < Chingu::GameState
  def initialize
    super
    @spaceship = Spaceship.create
  end

  # Game logic goes here
  def update
    super
  end
end

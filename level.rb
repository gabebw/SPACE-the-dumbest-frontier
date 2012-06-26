class Level < Chingu::GameState
  ENEMY_PROBABILITY_PER_TICK = 0.25
  MAX_ENEMIES = 5

  def initialize
    super
    @spaceship = Spaceship.create
  end

  def update
    super

    if enemy_needed?
      Enemy.create
    end

    @spaceship.each_collision(Enemy) do |spaceship, enemy|
      enemy.destroy
    end
  end

  private

  def enemy_needed?
    rand < ENEMY_PROBABILITY_PER_TICK && Enemy.all.size < MAX_ENEMIES
  end
end

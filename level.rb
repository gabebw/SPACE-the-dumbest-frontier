class Level < Chingu::GameState
  ENEMY_PROBABILITY_PER_TICK = 0.25
  MAX_ENEMIES = 5

  def initialize
    super
    @spaceship = Spaceship.create
    @score = 0
    @score_text = Chingu::Text.create("Score: #{@score}", x: 10, y: 10, zorder: 55, size: 20)
  end

  def update
    super

    if enemy_needed?
      Enemy.create
    end

    @spaceship.each_collision(Enemy) do |spaceship, enemy|
      enemy.destroy
      @score += Enemy::SCORE
      update_score_text
    end
  end

  private

  def enemy_needed?
    rand < ENEMY_PROBABILITY_PER_TICK && Enemy.all.size < MAX_ENEMIES
  end

  def update_score_text
    @score_text.text = "Score: #{@score}"
  end
end

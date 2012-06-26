class Level < Chingu::GameState
  def initialize
    super
    @spaceship = Spaceship.create
  end

  def update
    super

    if rand(100) < 4 && Enemy.all.size < 5
      Enemy.create
    end

    @spaceship.each_collision(Enemy) do |spaceship, enemy|
      enemy.destroy
    end
  end
end

/**
 * PROJECTILE SPRITES FLY AROUND THE GAME SCREEN CHECKING FOR COLLISIONS
 */
class ProjectileSprite extends AbstractSprite {

  HostileSprite shooter; //the sprite that the projectile came from (has a team)

  /**
   * LOADED CONSTRUCTOR
   */
  ProjectileSprite(HostileSprite shooter, int radius, PShape graphic, PVector position, PVector velocity) {
    super(position, velocity);
    this.shooter = shooter;
    this.create(graphic, radius);
  }

  /**
   * OVERRIDE THE ABSTRACT SUPER CLASS: ADD FUNCTIONALITY TO CHECK FOR COLLISIONS
   */ 
  @Override
  void update() {
    position.add(velocity);
    checkCollisions();
    if (this.position.y < -this.radius) {
      sprites.remove(this);
    }
  }

  /**
   * MODIFIES GAME STATS WHEN COLLISIONS OCCUR. PLAYERS LOSE LIVES, ENEMIES ARE REMOVED FROM DRAW LIST
   */
  void checkCollisions() {
    for (int i = 0; i < enemies.size (); i++) {
      HostileSprite enemy = (HostileSprite)enemies.get(i);
      if (this.shooter.team != enemy.team && isColliding(this, enemy)) {
        if (enemy == player) {
          playerLives--;
          this.destroy();
        } else {
          this.destroy();
          enemy.destroy();
        }
      }
    }
  }
}


/**
 * ALL SPRITES IN THIS GAME HAVE SOME COMMON FUNCTIONS, DEFINED IN THIS ABSTRACT CLASS
 */
abstract class AbstractSprite implements Sprite {
  PVector position;
  PVector velocity;
  PShape graphic;
  int radius;

  //LOADED CONSTRUCTOR
  AbstractSprite(PVector position, PVector velocity) {
    this.position = position;
    this.velocity = velocity;
  }

  /**
   * CREATE A SPRITE WITH GRAPHIC AND HITBOX (RADIUS)
   */
  void create(PShape graphic, int radius) {
    this.graphic = graphic;
    this.radius = radius;
  }

  /**
   * DESTROY A SPRITE BY REMOVING IT FROM THE SPRITE LISTS
   */
  void destroy() {
    sprites.remove(this);
    enemies.remove(this);
  }

  /**
   * UPDATE SPRITE POSITION ON SCREEN
   */
  void update() {
    if (this != player) {
      if (isRightBound(this) || isLeftBound(this)) {
        velocity = new PVector(-1 * velocity.x, 0);
      }
    }
    position.add(velocity);
  }

  /**
   * DISPLAY SPRITE AT ITS POSITION
   */
  void display() {
    shape(graphic, position.x, position.y);
  }

  /**
   * CONVENIENT METHOD TO CALL UPDATE AND DISPLAY AT THE SAME TIME
   */
  void updateAndDisplay() {
    update();
    display();
  }

  /**
   * CHECK CIRCLE-CIRCLE COLLISION BY RADIUS
   */
  boolean isColliding(AbstractSprite a, AbstractSprite b) {
    float dx = a.position.x - b.position.x;
    float dy = a.position.y - b.position.y;
    float rr = a.radius + b.radius;
    if (dx * dx + dy * dy < rr * rr) {
      return true;
    } else {
      return false;
    }
  }
}




























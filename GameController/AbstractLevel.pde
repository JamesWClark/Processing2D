/**
 * ABSTRACT LEVEL PROVIDES FUNCTIONS FOR USE IN THE GAME CONTROLLER'S SETUP AND DRAW
 */
abstract class AbstractLevel implements Level {

  abstract void levelSetup();
  abstract void levelDraw();

  /**
   * ADVANCES TO THE NEXT LEVEL, CLEARS ALL PROJECTILES ON SCREEN, ANIMATES A LEVEL TRANSITION
   */
  void advance() {
    lockedControls = true;
    //remove all projectiles
    for (int i = 0; i < sprites.size (); i++) {
      if (sprites.get(i) instanceof ProjectileSprite) {
        sprites.remove(i);
      }
    }
    player.velocity = new PVector(0, -8);
    if (player.position.y < 0 - 3 * player.radius) {
      stage++;
      if (stage > levels.size() - 1) {
        endGame("win");
      } else {
        currentLevel = levels.get(stage);
      }
    }
  }
}


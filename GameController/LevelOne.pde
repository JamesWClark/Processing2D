/**
 * LEVEL ONE - CONCRETE IMPLEMENTATION OF A LEVEL
 */
class LevelOne extends AbstractLevel {

  boolean intro = true;
  long timeSinceLastEnemyShot = 0;
  long enemyShotDelay = 400; //ms
  
  //DEFAULT CONSTRUCTOR
  LevelOne() {
  }

  //LOCK CONTROLS, SET PLAYER POSITION AND SPEED
  void levelSetup() {
    lockedControls = true;
    player.position = new PVector(0.5 * width, height + 6 * player.radius);
    player.velocity = new PVector(0, -3);
  }
  
  //CALLED REPEATEDLY IN MAIN DRAW LOOP
  void levelDraw() {
    if (intro)
      playIntro();
    else
      fight();
  }

  //ANIMATE PLAYER FLYING IN
  void playIntro() {
    if (player.position.y <= playerControllerLine) {
      player.velocity = new PVector(0, 0);
      player.position.y = playerControllerLine;
      lockedControls = false;
      spawnEnemies();
      intro = false;
    }
  }

  //COMMENCE BATTLE UNTIL THE LEVEL IS COMPLETE
  void fight() {
    automateEnemies();
    if (levelIsComplete()) {
      advance();
    }
  }

  //CREATE A COLLECTION OF ENEMIES
  void spawnEnemies() {
    int radius = factory.getBasicEnemyRadius();
    int enemyRows = 4;
    int enemyCols = width / (4 * radius);
    for (int i = 0; i < enemyRows; i++) {
      for (int j = 0; j < enemyCols; j++) {
        PShape graphic = factory.getBasicEnemy();
        PVector position = new PVector(2*radius + 1 + j*100, 2*radius + i*100);
        PVector velocity = new PVector(enemySpeedLimit, 0);
        HostileSprite enemy = new HostileSprite(enemiesTeam, radius, graphic, position, velocity);
        sprites.add(enemy);
        enemies.add(enemy);
      }
    }
  }

  /**
   * AUTOMATE THE ENEMIES (THEY MOVE LEFT AND RIGHT SHOOTING AT THE PLAYER)
   */
  void automateEnemies() {
    long now = millis();
    int i = (int)random(0, enemies.size());
    HostileSprite enemy = (HostileSprite)enemies.get(i);
    if (now > timeSinceLastEnemyShot + enemyShotDelay && enemy != player) {
      enemy.fire(player, 8);
      timeSinceLastEnemyShot = now;
    }
  }

  //A LEVEL IS COMPLETE WHEN THE ENEMIES COLLECTION IS BIGGER THAN 1 OR DOES NOT CONTAIN THE PLAYER
  boolean levelIsComplete() {
    if (enemies.size() > 1 && enemies.contains(player)) {
      return false;
    } else {
      return true;
    }
  }
}


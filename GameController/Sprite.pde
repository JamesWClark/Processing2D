/**
 * THE SPRITE INTERFACE - PROVIDES CONTRACTS FOR 
 * 1. create a sprite
 * 2. destroy a sprite
 * 3. update a sprite's position on screen
 * 4. display a sprite on screen
 * 5. conveniently update and display at the same time
 *
 * interesting remark - these are basically CRUD operations
 */
interface Sprite {
  void create(PShape graphic, int radius);
  void destroy();
  void update();
  void display();
  void updateAndDisplay();
}


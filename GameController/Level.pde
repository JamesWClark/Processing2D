/**
 * THE LEVEL INTERFACE - PROVIDES CONTRACTS FOR 
 * 1. advance the game to another level
 * 2. setup a new level one time
 * 3. draw repeatedly in the main draw loop
 * 4. check for completion of a level (presumably before advancing)
 */
interface Level {
  void advance();
  void levelSetup();
  void levelDraw();
  boolean levelIsComplete();
}


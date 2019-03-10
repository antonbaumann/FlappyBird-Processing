Game game;

void setup() {
  size(400, 600);
  frameRate(60);
  game = new Game();
}

void draw() {
  game.update();
  game.show();
}

void keyPressed() {
  game.handleKeyPressed();
}

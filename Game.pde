import java.util.Iterator;

class Game {
  
  // game
  private float pos = 0;
  private float vel = 2;
  private float acc = 0.0002;
  private boolean running = true;
  
  // constants
  public final color bgColor = color(100, 100, 100);
  public final color birdColor = color(255);
  public final color pipeColor = color(255);
  public final float gravity = 0.2;
  
  // entities
  private Bird bird;
  private ArrayList<Pipe> pipes;
  
  
  public Game() {
    bird = new Bird(-6, 20);
    pipes = new ArrayList(8);
    pipes.add(new Pipe(pos));
  }
  
  public void mouseClick() {
    bird.flap();
  }
  
  public void update() {
    if (running) {
      updatePipes();
      bird.update();
      pos += vel;
      vel += acc;
    }
  }
  
  public void updatePipes() {
    while (pipes.size() < 8) pipes.add(new Pipe(pipes.get(pipes.size() - 1).pos));
    Iterator<Pipe> i = pipes.iterator();
    while (i.hasNext()) {
     Pipe pipe = i.next();
     if (pipe.pos + pipe.w < pos) i.remove();
    }
  }
  
  public void gameOver() {
    running = false;
  }
  
  public void show() {
    background(bgColor);
    bird.show();
    for (Pipe pipe : pipes) {
       if (pipe.pos <= pos + width) {
          pipe.show();
        } else break;
    }
  }
  
}

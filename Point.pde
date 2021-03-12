class Point {
  PVector Pos;
  PVector Speed;
  PVector Pos0;

  Point() {
    Pos0 = new PVector(random (0, width), height);
    Speed = new PVector(random(-10, 10), random(-10, 10));
    Pos = new PVector(Pos0.x, Pos0.y) ;
  }

  void update() {
    Pos.add(Speed);
    //Speed = new PVector(random(-10, 10), random(-10, 10));
  }

  void show() {
    fill(0, 255, 0);
    noStroke();
    ellipse(Pos.x, Pos.y, 16, 16);
  }

  void edges() {
    if (Pos.x<0 || Pos.x>width) {
      Speed.x *= -1;
    }
    if (Pos.y<0 || Pos.y>height) {
      Speed.y *= -1;
    }
  }
}

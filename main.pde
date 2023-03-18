ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(800, 800); 
  fill(0, 255, 0);
  Particle p1 = new Particle(new Vector2D(400, 300), new Vector2D(1, 0), 100, 20);
  Particle p2 = new Particle(new Vector2D(400, 500), new Vector2D(-1, 0), 100, 20);
  Particle p3 = new Particle(new Vector2D(500, 400), new Vector2D(0, 1), 100, 20);
  Particle p4 = new Particle(new Vector2D(300, 400), new Vector2D(0, -1), 100, 20);
  particles.add(p1);
  particles.add(p2);
  particles.add(p3);
  particles.add(p4);
}

void draw_particle(Particle p) {
  if(p.is_dead()) { return; }
  float r = p.get_radius();
  Vector2D pos = p.get_pos();
  circle(pos.x, pos.y, r);
}

void draw() {
  background(0);
  for(int i=0 ; i < particles.size() ; ++i) {
    Particle p = particles.get(i);
    draw_particle(p);
    
    for(int j=0 ; j < particles.size() ; ++j) {
      if(j == i) { continue; }
      
      p.update_grav(particles.get(j));
    }
    p.update_pos();
  }
  
}

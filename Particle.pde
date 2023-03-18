float GRAV_CONST = 1.0;
class Particle {
  private float m_mass;
  private float m_radius;
  private boolean m_dead;

  private Vector2D m_pos;
  private Vector2D m_vel;
  

  Particle(Vector2D pos, Vector2D vel, float mass, float radius) {
    m_dead = false;
    m_pos = pos;
    m_vel = vel;
    m_mass = mass;
    m_radius = radius;
  }
  
  void update_pos() {
    m_pos.x += m_vel.x;
    m_pos.y += m_vel.y;
  }
  
  public void kill() {
    m_dead = true;
  }
  
  public boolean is_dead() {
    return m_dead; 
  }
  
  void update_grav(Particle source) {
    Vector2D s_pos = source.get_pos();
    
  

    float X = s_pos.x - m_pos.x;
    float Y = s_pos.y - m_pos.y;
    float distance = sqrt(X*X + Y*Y);
    
    if(distance < m_radius + source.get_radius()) {
      this.kill();
      source.kill();
    }
    
    float inv_distance = 1/distance;
    
    //creating our radial unit vector from particle to source
    float e_x = X*inv_distance;
    float e_y = Y*inv_distance;
    
    float s_strength = source.get_grav();
    float a_x = s_strength * (inv_distance*inv_distance) * e_x;
    float a_y = s_strength * (inv_distance*inv_distance) * e_y;
    
    m_vel.x += a_x;
    m_vel.y += a_y;
  }
  
  float get_radius() {
   return m_radius; 
  }
  
  Vector2D get_pos() {
    return m_pos;
  }
  
  Vector2D get_vel() {
    return m_vel;
  }
  
  float get_grav() {
    return GRAV_CONST * m_mass;
  }
  
  
  
  
}

class Star { 
  public final float x; 
  public final float y; 
  public final float diameter; 
  
  public Star(float x, float y) { 
    this.x = x; 
    this.y = y; 
    this.diameter = random(0.5, 2);
  }
} 
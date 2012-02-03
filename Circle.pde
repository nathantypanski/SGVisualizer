public class Circle {
  private int xLoc, yLoc, rad;
  private int currentX, currentY;
  private color colr;
  private int aura; private boolean auraGrowing;
  private int deg;
  
  //////////////////
  // constructors //
  //////////////////
  
  // constraits: /r/ is the radius, scaled between 0.0 (nothing drawn) and 1.0.
  //             /others/ contains an ArrayList<Circle> of all other objects onscreen.
  public Circle(float r, color c, ArrayList<Circle> others, int xSize, int ySize) {
    this.aura=0;
    this.deg=0;
    this.auraGrowing=true;
    this.setRadius(r); 
    this.colr=c;
    boolean found = false;
    int x=0; int y=0;
    while(!found) {
      x = int(random(0+rad, xSize-rad));
      y = int(random(0+rad, ySize-rad));
      found = true;
      search:
      for(Circle o : others) {
         // WARNING: does not scale properly!
         int distance = rad + o.getRadius();
         if (int(dist(x, y, o.getX(), o.getY())) < distance) {
           found = false;
           break search;
         }
      }
    }
    print("at (" + x + "," + y + ") with radius " + rad);
    this.xLoc = x;
    this.yLoc = y;
  }
  /////////
  // get //
  /////////
  public int getX() {
    return this.currentX;
  }
  public int getY() {
    return this.currentY;
  }
  public int getRadius() {
    return this.rad; 
  }
  public int getColor() {
    return this.colr; 
  }
  /////////
  // set //
  /////////
  
  // WARNING: Does not scale properly!
  // constraints: r is a float value between 0 and 1.
  public void setRadius(float r) {
    this.rad = int(r*100);
  }
  //////////
  // draw //
  //////////
  public void render() {
    this.currentX = this.xLoc + int(rad*cos(radians(deg)));
    this.currentY = this.yLoc + int(2*rad*sin(radians(deg)));
    fill(red(colr), green(colr), blue(colr), alpha(colr)/2);
    ellipse(this.currentX, this.currentY, this.rad+this.aura, this.rad+this.aura);
    if(this.auraGrowing) {
      this.aura++;
      if(this.aura>int(this.rad)) {
        this.auraGrowing = false;
      }
    }
    else {
      this.aura--;
      if(this.aura<0) {
        this.auraGrowing=true;
      }
    }
    fill(colr);
    ellipse(currentX, currentY,
            this.rad, this.rad);
    // Increment the degrees of orbit
    this.deg++;
    if (this.deg > 360)
      this.deg=0;
  }
}

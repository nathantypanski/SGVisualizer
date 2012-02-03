class Circle {
  private int xLoc, yLoc, rad;
  private color colr;
  private int aura; private boolean auraGrowing;
  
  //////////////////
  // constructors //
  //////////////////
  
  // constraits: /r/ is the radius, scaled between 0.0 (nothing drawn) and 1.0.
  //             /others/ contains an ArrayList<Circle> of all other objects onscreen.
  Circle(float r, color c, ArrayList<Circle> others, int xSize, int ySize) {
    this.aura=0;
    this.auraGrowing=true;
    this.setRadius(r); 
    this.colr=c;
    boolean found = false;
    int x=0; int y=0;
    while(!found) {
      print("x");
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
  int getX() {
    return this.xLoc;
  }
  int getY() {
    return this.yLoc;
  }
  int getRadius() {
    return this.rad; 
  }
  /////////
  // set //
  /////////
  
  // WARNING: Does not scale properly!
  // constraints: r is a float value between 0 and 1.
  void setRadius(float r) {
    this.rad = int(r*100);
  }
  //////////
  // draw //
  //////////
  void render() {
    fill(red(colr), green(colr), blue(colr), alpha(colr)/2);
    ellipse(xLoc, yLoc, rad+aura, rad+aura);
    if(auraGrowing) {
      aura++;
      if(aura>int(rad/2)) {
        auraGrowing = false;
      }
    }
    else {
      this.aura--;
      if(aura<0) {
        this.auraGrowing=true;
      }
    }
    fill(colr);
    ellipse(xLoc, yLoc, rad, rad);
  }
}

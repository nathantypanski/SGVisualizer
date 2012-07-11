public class Circle {

  // The initial x and y locations of this circle (used to calculate orbit).
  private int xLoc, yLoc;
  // The radius of this circle.
  private int rad;
  // The current x and y locations of this circle.
  private int currentX, currentY;
  // The color of this circle;
  private color colr;
  // Stores the current size of the circle's aura.
  private int aura;
  // Whether the aura is growing (true) or shrinking (false).
  private boolean auraGrowing;
  // The degrees from the intial location that the circle has orbited.
  private int deg;
  private ArrayList<Circle> circles = new ArrayList();

  private boolean timer;
  private int timerStart;
  private int timerEnd;
  private boolean suicide;

  //////////////////
  // constructors //
  //////////////////

  // constraits: /r/ is the radius, scaled between 0.0 (nothing drawn) and 1.0.
  //             /others/ contains an ArrayList<Circle> of all other objects onscreen.
  public Circle(float r, color c, int lifespan) {
    this.aura=0;
    this.deg=0;
    this.auraGrowing=true;
    this.setRadius(r); 
    this.colr=c;
    boolean found = false;
    suicide = false;
    this.timer = true;
    this.timerStart = millis();
    this.timerEnd=lifespan;
    this.setX(int(random(0+rad, xSize-rad)));
    this.setY(int(random(0+rad, ySize-rad)));
  }

  /////////
  // get //
  /////////

  // Returns the current x location of this circle.
  public int getX() {
    return this.currentX;
  }
  // Returns the current y location of this circle.
  public int getY() {
    return this.currentY;
  }
  // Returns the radius of this circle.
  public int getRadius() {
    return this.rad;
  }
  // Returns the color of this circle.
  public color getColor() {
    return this.colr;
  }
  public boolean killed() {
    return suicide;
  }
  /////////
  // set //
  /////////

  // Sets the x location of this circle.
  public void setX(int x) {
    this.xLoc = x;
    this.currentX = x;
  }

  // Sets the y location of this circle.
  public void setY(int y) {
    this.yLoc = y;
    this.currentY = y;
  }

  // WARNING: Does not scale properly!
  // constraints: r is a float value between 0 and 1.
  public void setRadius(float r) {
    this.rad = int(r);
  }

  //////////
  // draw //
  //////////
  public void render() {
    noStroke();
    this.currentX = this.xLoc + int(rad*cos(radians(deg)));
    this.currentY = this.yLoc + int(rad*sin(radians(deg)));
    // draw the aura
    //fill(red(colr), green(colr), blue(colr), alpha(colr)/5);
    fill(cAura);
    ellipse(this.currentX, this.currentY, this.rad+this.aura, this.rad+this.aura);
    if (millis() % 2 == 0) {
      if (this.auraGrowing) {
        this.aura++;
        if (this.aura>random(rad, rad*10)) {
          this.auraGrowing = false;
        }
      }
      else {
        this.aura--;
        if (this.aura<0) {
          this.auraGrowing=true;
          this.aura=0;
        }
      }
    }
    // draw the circle
    fill(colr);
    ellipse(currentX, currentY, this.rad, this.rad);
    // update its location
    
    // Increment the degrees of orbit
    this.deg++;
    if (this.deg > 360)
      this.deg=0;
    if (timer && millis() - timerStart >= timerEnd) {
      this.suicide=true;
    }
  }
}


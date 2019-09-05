class Node{
    private float x;
    private float y;
    private float radius = 50;
    private boolean isMouseOver;


    public Node(float x, float y){
        this.x = x;
        this.y = y;
    }

    public Node(PVector vector){
        x = vector.x;
        y = vector.y;        
    }
    
    public float getX(){
      return x;
    }

    public float getY(){
      return y;
    }
    
    public void setXY(boolean pressed){
      if(pressed && isMouseOver){
        x = pmouseX;
        y = pmouseY;
      }
    }

    public void display(){
        color c = isMouseOver?color(0,255,0):color(255);
        fill(c);
        ellipse(x,y,radius,radius);
    }

    public void overCircle(){
      float disX = x - mouseX;
      float disY = y - mouseY;
      isMouseOver = (sqrt(sq(disX) + sq(disY)) < radius/2);
    }
   
}

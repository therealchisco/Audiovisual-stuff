class Edge{
  private PVector a;
  private PVector b;
  private color clr = color(100,100,130);
  
  public Edge(PVector a, PVector b){
    this.a = a;
    this.b = b;
  }
  
  public Edge(PVector[] segment){
    a = segment[0];
    b = segment[1];
  }
  
  public void adjustLength(PVector intersection){
    if(aLessThanB()){
      a = intersection;
    }else{
      b = intersection;
    }
  }
  
  private boolean aLessThanB(){
    return a.dot(1,1,1)<b.dot(1,1,1);
  }
  
  public void display(){
    fill(clr);
    line(a.x,a.y,b.x,b.y);
  }
  
    
}

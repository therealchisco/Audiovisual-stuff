class Edge{
    private Node start;
    private Node end;
    private float startX;
    private float startY;
    private float endX;
    private float endY;
    int thicc = 6;

    public Edge(Node start, Node end){
        this.start = start;
        this.end = end;
        setXY();
    }
    
    private void setXY(){  
      updateXY();
    }
    
    private void updateXY(){
        startX = start.getX();
        startY = start.getY();
        endX = end.getX();
        endY = end.getY();  
    }

    public void display(){
        updateXY();
        strokeWeight(thicc);
        line(startX,startY,endX,endY);
    }
        

}

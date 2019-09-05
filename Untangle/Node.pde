class Node{
    private PVector point;
    private float x;
    private float y;
    private float radius = 20;

    public Node(PVector point){
        this.point = point;
        x = point.x;
        y = point.y;
    }

    void display(){
        ellipse(x,y,radius,radius);
    }

}

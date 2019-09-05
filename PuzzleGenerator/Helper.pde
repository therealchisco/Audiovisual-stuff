class Helper{
   
    private ArrayList<PVector[]> segmentList = new ArrayList<PVector[]>();

    private ArrayList<PVector> pointList = new ArrayList<PVector>();

    private ArrayList<Node> nodeList = new ArrayList<Node>();

    private ArrayList<Edge> edgeList = new ArrayList<Edge>();

    /*
     * Construct a Helper Object
     * initialices arraylists
     *	@param n number of nodes
     */
    public Helper(int n){
        newSetOfSegments(n);
        addNodes();
        addEdgesCycleGraph();
    }



    /**
     *	returns a 2D PVector with random x, y values between 0 and width/2
     */
    private PVector generateRandomPoint(){

        float x = random(0,width/2);
        float y = random(0,height/2);
        println(x);
        return new PVector(x,y);
        
    }

    /**
     *	adds radom 2D PVector to a list of Points (PVectors)
     */
    private void addPoint(){
        PVector point = generateRandomPoint();
        pointList.add(point);
    }

    /**
     *	clears the list of Points and adds n new random ones
     */
    private void newSetOfPoints(int n){
        pointList.clear();
        for(int i = 0; i < n; i++){
            addPoint();
        }
    }


    /**
     *	Returns a "tuple" of Points (PVector[] = {point1, point2} with random values
     */
    private PVector[] generateRandomSegment(){
       PVector point1, point2;
        point1 = generateRandomPoint();
        point2 = generateRandomPoint();
        PVector[] segment = {point1,point2};
        if(segment.equals(null)){
          println("Pilah");
        }
        return segment;
    }


    /**
     *	Generates random segment and adds it to the list of segments
     */
    private void addSegment(){
        segmentList.add(generateRandomSegment());
    }

    
    /**
     *	Adds n random Segments to the list
     */
    private void newSetOfSegments(int n){
        segmentList.clear();
        for(int i = 0; i < n; i++){
            addSegment();
            println("adding "+i+" segment"); 
        }
    }


    public void newPuzzle(int n){
        nodeList.clear();
        segmentList.clear();
        //int n = int(random(6,10));
        //newSetOfSegments(n);
        generateSegments(n);
        addNodes();
        addEdges();
    }
    
    public void newPuzzle(){
      newPuzzle(8);
    }


    void generateSegments(int n){
    while(segmentList.size()<n){
        PVector[] segment = generateRandomSegment();
        if(!isParallel(segment)){
            segmentList.add(segment);
        }
    }
    }
    
    boolean isParallel(PVector[] segment){
    boolean result = false;
    for(PVector[] s: segmentList){
        result = result || isParallel(s,segment);
    }
    return result;
    }

    boolean isParallel(PVector[] v1, PVector[] v2){
    float a1 = v1[1].y - v1[0].y;
    float b1 = v1[0].x - v1[1].x;
    float a2 = v2[1].y - v2[0].y;
    float b2 = v2[0].x - v2[1].x;
    float determinant = a1*b2 - a2*b1;
    return determinant==0;
    }

    private PVector getIntersection(PVector[] s1, PVector[] s2){
        float a1 = s1[1].y - s1[0].y;
        float b1 = s1[0].x - s1[1].x;
        float c1 = a1*s1[0].x + b1*s1[0].y;
        float a2 = s2[1].y - s2[0].y;
        float b2 = s2[0].x - s2[1].x;
        float c2 = a2*s2[0].x+b2*s2[0].y;
        float determinant = a1*b2 - a2*b1;
        float x = (b2*c1 - b1*c2)/determinant;
        x = abs((x%width)+random(200));
        float y = (a1*c2 - a2*c1)/determinant;
        y = abs((y%width)+random(200));
        return new PVector(x,y);
    }

    private void addNodes(){
        nodeList.clear();
        int size = segmentList.size() - 1;
        for(int i = 0; i < size; i++){
            PVector[] s1,s2;
            s1 = segmentList.get(i);
            s2 = segmentList.get(i+1);
            PVector interesection = getIntersection(s1,s2);
            Node node = new Node(interesection);
            nodeList.add(node);
        }
    }


    private void addEdges(){
        edgeList.clear();
        addEdgesCycleGraph();
        addRandomEdges();
    }


    // Creates a Simple Cycle Graph
    // i.e all Edges are connected in a closed Chain
    private void addEdgesCycleGraph(){
        int size = nodeList.size() - 1;
        for(int i = 0; i < size; i++){
            Node start = nodeList.get(i);
            Node end = nodeList.get(i+1);
            Edge edge = new Edge(start,end);
            edgeList.add(edge);
        }
        Node start = nodeList.get(size);
        Node end = nodeList.get(0);
        Edge edge = new Edge(start,end);
        edgeList.add(edge);
    }



    // Creates edges between random Nodes and adds them to the List
    private void addRandomEdges(){
        int size = nodeList.size();
        int a = 0;
        int b = 0;
        for(int i = 0; i < size; i++){
            /* Selects two random indices from the NodeList            
            while(a==b){
                a = int(random(0,size-1));
                b = int(random(0,size-1));
            }*/
            a = int(random(0,size-1));
            b = (a+2)%(size-1);
            
            // Creates an Edge between the nodes at those indices
            Edge edge = new Edge(nodeList.get(a),nodeList.get(b));

            // Adds the Edge to the list
            edgeList.add(edge);
        }
    }


    // Iterates the list of edges and draws a line on the screen to represent each one
    private void displayEdges(){
        for(Edge edge: edgeList){
            edge.display();
        }
    }

    // Iterates the list of nodes and draws an ellipse to represent each one
    private void displayNodes(){
        for(Node node : nodeList){
            node.display();
        }
    }

    // Draws all edges and nodes
    public void displayPuzzle(){
        checkMouse();
        displayEdges();
        displayNodes();
    }
    
    public void updateNodes(boolean pressed){
      for(Node node: nodeList){
        node.overCircle();
        node.setXY(pressed);
      }
    }
        
    public void checkMouse(){
      for(Node node: nodeList){
        node.overCircle();
      }
    }
        
    // Draws puzzle with specified Stroke Color
    public void displayPuzzle(float clr){
        stroke(clr);
        displayPuzzle();
    }
        
    public ArrayList<Node> getNodeList(){
        return nodeList;
    }
    
    public ArrayList<Edge> getEdgeList(){
        return edgeList;
    }

}

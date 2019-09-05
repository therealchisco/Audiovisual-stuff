float radius = 20;

ArrayList<PVector[]> segmentList = new ArrayList<PVector[]>();
ArrayList<PVector> intersectionList = new ArrayList<PVector>();
ArrayList<Edge> edgeList = new ArrayList<Edge>();
ArrayList<Node> nodeList = new ArrayList<Node>();

void setup() {
  smooth();
  radius = 20;
  size(500,500);
  generateSegments(6);
  generateIntersections();
  createCycleGraph();
}


void draw() {
  drawEdges();
  drawNodes();
}

/*
void drawLineSegment(PVector[] segment){
  line(segment[0].x,segment[0].y,segment[1].x,segment[1].y);  
}*/

void drawEdges(){
  for(Edge edge: edgeList){
    edge.display();
  }
}

void drawNodes(){
  for(Node node: nodeList){
    node.display();
  }
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

PVector getIntersection(PVector[] v1, PVector[] v2){
  float a1 = v1[1].y - v1[0].y;
  float b1 = v1[0].x - v1[1].x;
  float c1 = a1*v1[0].x + b1*v1[0].y;
  float a2 = v2[1].y - v2[0].y;
  float b2 = v2[0].x - v2[1].x;
  float c2 = a2*v2[0].x+b2*v2[0].y;
  float determinant = a1*b2 - a2*b1;
  float x = (b2*c1 - b1*c2)/determinant;
  float y = (a1*c2 - a2*c1)/determinant;
  return new PVector(x,y);
}

void generateIntersections(){
  for (int i = 0; i < segmentList.size() - 1; i++) {
    PVector intersection = getIntersection(segmentList.get(i),segmentList.get(i+1));
    intersectionList.add(intersection);
    Node node = new Node(intersection);
    nodeList.add(node);
   }
}

PVector[] generateRandomSegment() {
  PVector[] segment = new PVector[2];
  segment[0] = generateRandomPoint();
  segment[1] = generateRandomPoint();
  return segment;
}

PVector generateRandomPoint() {
  float x = random(radius,width-radius*3);
  float y = random(radius,height-radius*3);
  return new PVector(x,y);
}


void createCycleGraph(){
  // Creates a trivial cycle graph using all nodes
  for(int i = 0; i < intersectionList.size()-1; i++){
    Edge e = new Edge(intersectionList.get(i),intersectionList.get(i+1));
  } 
}
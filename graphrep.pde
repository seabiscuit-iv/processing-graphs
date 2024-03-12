public int nodeSize = 50;
float centerX;
float centerY;

int numNodes;
float angleIncrement;
float radius;

color[] nodeColors;
color[][] edgeColors;

void graphSetup(int[][] graph) {
  numNodes = graph.length;
  centerX = width/2;
  centerY = height/2;
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  stroke(255);

  nodeColors = new color[numNodes];
  for(int i = 0; i < numNodes; i++){
    nodeColors[i] = color(255);
  }

  edgeColors = new color[numNodes][numNodes];
  for(int i = 0; i < numNodes; i++){
    for(int j = 0; j < numNodes; j++){
      edgeColors[i][j] = color(255);
    }
  }

  angleIncrement = TWO_PI / numNodes;
  radius = min(width, height) / 3;
}

void drawGraph(int[][] graph) {
  for (int i = 0; i < numNodes; i++) {
    for (int j = i + 1; j < numNodes; j++) {
      if (graph[i][j] == 1) {
        float angle1 = i * angleIncrement;
        float angle2 = j * angleIncrement;
        float x1 = centerX + cos(angle1) * radius;
        float y1 = centerY + sin(angle1) * radius;
        float x2 = centerX + cos(angle2) * radius;
        float y2 = centerY + sin(angle2) * radius;
        stroke(edgeColors[i][j]);
        line(x1, y1, x2, y2);
      }
    }
  }

  stroke(color(0));

  for (int i = 0; i < numNodes; i++) {
    PVector point = getPointOfNode(i);
    float x = point.x;
    float y = point.y;
    fill(nodeColors[i]);
    ellipse(x, y, nodeSize, nodeSize);
    fill(0);
    text(i, x, y);
    fill(255);
  }
}

PVector getPointOfNode(int node){
  float angle = node * angleIncrement;
  float x = centerX + cos(angle) * radius;
  float y = centerY + sin(angle) * radius;
  return new PVector(x, y);
}

void changeNodeColor(int node, color c){
  nodeColors[node] = c;
}

void changeEdgeColor(int from, int to, color c){
  edgeColors[from][to] = c;
}

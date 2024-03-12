int numNodes = 6;
int[][] adjacencyMatrix = new int[numNodes][numNodes];

int nodeSize = 50;
float centerX;
float centerY;
float radius = min(width, height) * 3 / 2;
float angleIncrement = TWO_PI / numNodes;

void setup() {
  for (int i = 0; i < numNodes; i++) {
    for (int j = i + 1; j < numNodes; j++) {
      if (random(1) > 0.5) {
        adjacencyMatrix[i][j] = 1;
        adjacencyMatrix[j][i] = 1;
      }
    }
  } 

  size(600, 600);
  centerX = width/2;
  centerY = height/2;
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  stroke(255);
}

void draw() {
  background(0);
  drawGraph();
}

void drawGraph() {
  for (int i = 0; i < numNodes; i++) {
    for (int j = i + 1; j < numNodes; j++) {
      if (adjacencyMatrix[i][j] == 1) {
        float angle1 = i * angleIncrement;
        float angle2 = j * angleIncrement;
        float x1 = centerX + cos(angle1) * radius;
        float y1 = centerY + sin(angle1) * radius;
        float x2 = centerX + cos(angle2) * radius;
        float y2 = centerY + sin(angle2) * radius;
        line(x1, y1, x2, y2);
      }
    }
  }

  for (int i = 0; i < numNodes; i++) {
    float angle = i * angleIncrement;
    float x = centerX + cos(angle) * radius;
    float y = centerY + sin(angle) * radius;
    ellipse(x, y, nodeSize, nodeSize);
    fill(0);
    text(i, x, y);
    fill(255);
  }
}

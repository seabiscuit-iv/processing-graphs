int[][] graph;
int nodes = 6;
int FRAMERATE = 60;
int frame = 0;
boolean run = false;

void setup() {
    frameRate(FRAMERATE);
    graph = generateRandomGraph(nodes);
    graph[2][3] = 1;
    graph[3][2] = 1;
    size(600, 600);
    graphSetup(graph);
}

void draw() {
    background(0);
    drawGraph(graph);

    if (!run) {
        thread("dfs");
        run = true;
    }
}

public void dfs(){
    delay(1000);
    changeNodeColor(1, color(100, 0, 0));
}

int[][] generateRandomGraph(int numNodes){
    int[][] adjacencyMatrix = new int[numNodes][numNodes];
    
    for (int i = 0; i < numNodes; i++) {
        for (int j = i + 1; j < numNodes; j++) {
        if (random(1) > 0.5) {
            adjacencyMatrix[i][j] = 1;
            adjacencyMatrix[j][i] = 1;
        }
        }
    } 

    return adjacencyMatrix;
}
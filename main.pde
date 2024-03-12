int[][] graph;
int nodes = 6;
int FRAMERATE = 60;
int frame = 0;
boolean run = false;
boolean[] visited;

void setup() {
    frameRate(FRAMERATE);
    graph = generateRandomGraph(nodes);
    size(600, 600);
    graphSetup(graph);
}

void draw() {
    background(0);
    drawGraph(graph);

    if (!run) {
        thread("runDFS");
        run = true;
    }
}

public void runDFS(){
    visited = new boolean[graph.length];
    for(int i = 0; i < graph.length; i++){
        if(!visited[i]){
            dfs(i);
        }
    }
    // dfs(0);
}

public void dfs(int node){
    visited[node] = true;
    // println("Entered " + node);
    delay(1000);
    changeNodeColor(node, color(100, 0, 0));
    for(int i = 0; i < graph.length; i++){
        if(!visited[i] && graph[node][i]==1){
            delay(1000);
            // println("Changed edge " + node + " to " + i);
            changeEdgeColor(node, i, color(100, 0, 0));
            dfs(i);
            delay(1000);
            changeEdgeColor(node, i, color(255));
        }
    }
    delay(1000);
    changeNodeColor(node, color(0, 100, 0));
    // println("Leaving " + node);
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
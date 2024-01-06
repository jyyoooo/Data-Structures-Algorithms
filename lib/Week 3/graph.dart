import 'dart:collection';

class Graph {
  Map<int, List<int>> map = HashMap();

  addVertex(int data) {
    map.putIfAbsent(data, () => []);
  }

  insert(int vertex, int edge, bool isBiDir) {
    if (!map.containsKey(vertex)) {
      addVertex(vertex);
    }
    if (!map.containsKey(edge)) {
      addVertex(edge);
    }

    map[vertex]?.add(edge);

    if (isBiDir) {
      map[edge]?.add(vertex);
    }
  }

  display() {
    for (int x in map.keys) {
      print('$x contains:');
      for (int y in map[x]!) {
        print(y);
      }
    }
  }

  dfs(int start) {
    var visited = [];

    visit(vertex) {
      visited.add(vertex);
      for (int neighbor in map[vertex]!) {
        if (!visited.contains(neighbor)) {
          visit(neighbor);
        }
      }
    }

    visit(start);
    return visited;
  }

  List<int> bfs(int start) {
    List<int> visited = [];
    Queue<int> queue = Queue();

    visited.add(start);
    queue.add(start);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();

      for (int neighbor in map[currentVertex]!) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }

    return visited;
  }
}

main() {
  Graph graph = Graph();

  graph.insert(10, 1, true);
  graph.insert(20, 10, true);
  graph.insert(30, 40, true);
  graph.insert(40, 20, true);
  graph.insert(50, 5, true);

  graph.display();

  print(' DFS ${graph.dfs(20)}');
  print(' BFS ${graph.bfs(20)}');
}

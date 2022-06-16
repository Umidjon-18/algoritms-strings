import 'dart:collection';
import 'dart:core';

enum Color{
        WHITE, GRAY, BLACK
    }
void main(List<String> args) {
  
}

 class TopologicalSort {

     /*
     * Enum to represent the colors for the depth first search
     * */
    

     /*
     * Class to represent vertices
     * */}
    class Vertex {
        /*
        * Name of vertex
        * */
         final String label;

        /*
        * Weight of vertex
        * (more accurately defined as the time that a vertex has begun a visit in DFS)
        * */
        late int weight;

        /*
        * The time that the vertex has finished a visit in DFS
        * */
        late int finished;

        /*
        * π parent of the vertex
        * */
         Vertex predecessor;

        /*
        * Represents the category of visit in DFS
        * */
         Color color = Color.WHITE;

        /*
        * The array of names of descendant vertices
        * */
         final List<String> next = [];

        Vertex(String label) {
            this.label = label;
        }
     }

     /*
     * Graph class uses the adjacency list representation
     * */
    class Graph {

        /*
         * Adjacency list representation
         * */
        final Map<String, Vertex> adj = {};

        /*
         * Function to add an edge to the graph
         * */
        void addEdge(String label, List<String> next) {
            adj[label] = Vertex(label);
            if (!next[0].isEmpty)
                Collections.addAll(adj.get(label).next, next);
        }
    }

    static class BackEdgeException extends RuntimeException {

        public BackEdgeException(String backEdge) {
            super("This graph contains a cycle. No linear ordering is possible. " + backEdge);
        }

    }

    /*
     * Time variable in DFS
     * */
    private static int time;

    /*
     * Depth First Search
     *
     * DFS(G)
     *   for each vertex u ∈ G.V
     *       u.color = WHITE
     *       u.π = NIL
     *   time = 0
     *   for each vertex u ∈ G.V
     *   if u.color == WHITE
     *       DFS-VISIT(G, u)
     *
     * Performed in Θ(V + E) time
     * */
    public static LinkedList<String> sort(Graph graph) {
        LinkedList<String> list = new LinkedList<>();
        graph.adj.forEach((name, vertex) -> {
            if (vertex.color == Color.WHITE) {
                list.addFirst(sort(graph, vertex, list));
            }
        });
        return list;
    }

    /*
     * Depth First Search Visit
     *
     * DFS-Visit(G, u)
     *   time = time + 1
     *   u.d = time
     *   u.color = GRAY
     *   for each v ∈ G.Adj[u]
     *       if v.color == WHITE
     *           v.π = u
     *           DFS-Visit(G, u)
     *   u.color = BLACK
     *   time = time + 1
     *   u.f = time
     * */
    String sort2(Graph graph, Vertex u, LinkedList list) {
        time++;
        u.weight = time;
        u.color = Color.GRAY;
        graph.adj.get(u.label).next.forEach(label -> {
            if (graph.adj.get(label).color == Color.WHITE) {
                graph.adj.get(label).predecessor = u;
                list.addFirst(sort(graph, graph.adj.get(label), list));
            } else if (graph.adj.get(label).color == Color.GRAY) {
                /*
                 * A back edge exists if an edge (u, v) connects a vertex u to its ancestor vertex v
                 * in a depth first tree. If v.d ≤ u.d < u.f ≤ v.f
                 *
                 * In many cases, we will not know u.f, but v.color denotes the type of edge
                 * */
                throw new BackEdgeException("Back edge: " + u.label + " -> " + label);
            }
        });
        u.color = Color.BLACK;
        time++;
        u.finished = time;
        return u.label;
    }
}
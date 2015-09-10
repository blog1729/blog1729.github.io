---
layout: post
comments: true
title: Depth first search 
---

* In Depth-first-search strategy, the algorithm searches deeper in the graph whenever possible.
* Whenever depth-first search discovers a vertex $v$ during a scan of the adjacency list of an already discovered vertex $u$, it records this event by setting $v$'s predecessor attribute $v.\pi$ to $u$.
* We define the **predecessor subgraph** of depth first search as $G_{\pi} = (V, E_{\pi})$, where $E_\pi = \\{ (v.\pi, v) : v\in V \text{ and } v.\pi \neq \text{NIL} \\}$. The predecessor subgraphs of a depth first search forms a **depth first forest** comprising of several **dept-first trees**.
* A vertex is first white, then greyed once it is discovered and it's *starting time* is noted, further once all it's neighbouring vertices are visited, it is colored black and the *finishing time* is noted.

## Properties

* **Parenthesis theorem**: In any depth-first search of a directed or undirected graph $G = (V, E)$, for any two vertices $u$ and $v$, any one of the following property is true
  1. the intervals $[u.d, u.f]$ and $[v.d, v.f]$ are disjoint,
  2. the interval $[u.d, u.f]$ is a subset of the interval $[v.d, v.f]$, or
  3. the interval $[v.d, v.f]$ is a subset of the interval $[v.d, v.f]$.
* **Nesting of descendants' intervals**. Vertex $v$ is a proper descendant of the vertex $u$ in any depth-first forest for a directed or undirected graph $G$ if and only if $u.d < v.d < v.f < u.f$.
* **White-path theorem**. In a depth-first forest of a directed or undirected graph $G=(V,E)$, vertex $v$ is a descendant of vertex $u$ if and only if at time $u.d$ that the search discovers $u$, there is a path from $u$ to $v$ consisting entirely of white vertices.

## Classification of edges

We can classify the edges in the graph after doing a BFS search into the following

1. **Tree edges** are edges in the depth-first forest $G_\pi$. Edge $(u,v)$ is a tree edge if $v$ was first discovered by exploring edge $(u,v)$.
2. **Back edges** are those edges $(u,v)$ connecting a vertex $u$ to an ancestor $v$ in an depth-first tree. We consider self-loops to be back-edges.
3. **Forward edges** are those non-tree edges $(u,v)$ connecting a vertex $u$ to a descendant $v$ in a depth-first tree.
4. **Cross edges** are all other edges.

In the DFS algorithm, one can show that following proposition, here while at edge $u$, if we encounter the edge $(u,v)$, using the color of $v$, we can classify the edge $(u,v)$ as follows: 

1. White indicates a tree edge,
2. Gray indicates a Back edge,
3. Black indicates a cross edge or forward edge.

* **Theorem** In a depth-first search of an undirected graph $G$, every edge of $G$ is either a tree edge or a back edge.

## Notes

* Suppose $(u,v)$ is an edge of a graph $G$, then $(u,v)$ is
  1. a tree edge or forward edge if and only if $u.d < v.d < v.f < u.f$,
  2. a back edge if and only if $v.d \le u.d < u.f \le v.f$, and
  3. a cross edge if and only if $v.d < v.f < u.d < u.f$.
* We can use depth first search to identify the connected components of an undirected graph and that the depth first forests contains as many trees as $G$ has connected components, one can show that the connected components are vertices in each tree that constitute the breadth first forest. 


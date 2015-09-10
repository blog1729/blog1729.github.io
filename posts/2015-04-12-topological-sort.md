---
layout: post
comments: true
title: Topological sort
---

* A **topological sort** of a directed acyclic graph (DAG) is a linear ordering of it's vertices such that if $G$ contains an edge $(u,v)$, then $u$ comes before $v$ in the linear ordering.
* The algorithm is as follows
  1. Call DFS(G) to compute the finishing time of $v.f$ for each vertex $v$
  2. As each vertex if finished, insert it to the front of a linked list
  3. return the linked list
* Basically, the algorithm orders the vertices according to descending order of finishing time.
* The above algorithm takes a time complexity of $\Theta(V+E)$.

## Correctness

* **Lemma**. A directed graph $G$ is acyclic if and only if a depth-first search of $G$ yields no back edges. (This can be used in the proof of correctness of the aforementioned algorithm.)

## Notes

* **Lemma**. A directed acyclic graph $G$ shall contain at least a sink vertex, i.e., a vertex with out degree $0$.
* The above property can be used to devise another algorithm that can run in $\mathcal O(V+E)$. 
  1. Find the sink vertex
  2. Remove the vertex and nodes associated with the above vertex from the graph to obtain a new graph $G$.
  3. recurse on $G$ till $G$ is empty.
* In case of a directed graph $G$ that contains cycles, one might think that the TOPOLOGICAL-SORT will produce an ordering that minimizes the number of edges that are inconsistent, but this is incorrect.
* Suppose we are given a directed acyclic graph $G = (V,E)$ and two vertices $t$ and $s$ and we are required to find the number of simple paths from $s$ to $t$, then we can make use of the following algorithm
  1. Create a new attribute to the graph nodes and this attribute of all edges except $t$ to be zero and $t$'s attribute shall have value $0$.
  2. Do a DFS search, but when the DFS procedure discovers the node $t$, immediately, make it's color black.
  3. When a vertex $v$ finished, let the value of our attribute to be the sum of values of the attribute to it's immediate children.
  4. The value of the our attribute of $p$ after completion of DFS will be the number of simple paths from $p$ to $t$. 

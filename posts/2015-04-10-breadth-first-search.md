---
layout: post
comments: true
title: Breadth first search 
---

* Breadth first search is a simple algorithm for searching a graph.
* The following summarizes the algorithm when the inputs graph is given in adjacency list form and we also provide a source vertex
  * For all vertices except $s$, make the color white and the distance $d$ as $\infty$ and it's predecessor, i.e. $u.\pi$ as `nil`.
  * Make the color of $s$ as gray and insert $s$ into a queue which is initially empty.
  * Repeat the following until the Queue is empty
	* $u=$ Dequeue$(Q)$
	* for all vertex $v$ that is adjacent to $u$, repeat the steps
	  * if color of $v$ is white, then make the color grey, $v.d = u.d+1$, $v.\pi = u$ and enqueue $v$ into the Queue.
	* color $u$ as Black, which indicates that we are done with $u$.

* **Time complexity**, the time complexity of the above algorithm is $\mathcal O(V+E)$. 

## Analysis and Correctness

The following lemmas can be used to prove the correctness, here the graph $G=(V,E)$ can be directed or un-directed. By $\delta(u,v)$, we denote the length of the shortest path from $u$ to $v$, if it exists and if such a path doesn't exists, then it is $\infty$. 

* **Lemma** Let $s\in V$ be an arbitrary vertex. Then for any edge $(u,v)\in E$, $\delta(s, v) \le \delta(s,u)+1$.
* **Lemma** Suppose that BFS is run on $G$ from a given source vertex $s\in V$. Then upon termination, for each vertex $v\in V$, the $v.d$ computed by BFS satisfies $v.d \ge \delta(s,v)$.
* **Lemma** Suppose that the execution of BFS on a graph $G$, the queue $Q$ contains vertices $\langle v_1, v_2, \cdots, v_r \rangle$, where $v_1$ is the head of $Q$ and $v_r$ is the tail. Then $v_r.d\le v_1.d+1$ and $v_i.d\le v_{i+1}.d$ for $i=1,2,\cdots, r-1$.
* **Lemma** Suppose that the vertices $v_i$ and $v_j$ are enqueued during the execution of BFS, and that $v_i$ is enqueued before $v_j$, then $v_i.d \le v_j.d$ at the time that $v_j$ is enqueued.

## Breadth-first trees

* For a graph $G=(V,E)$ with source $s$, we define **predecessor subgraph** of $G$ as $G_\pi = (V_pi, E_pi)$, where $V_\pi = \\{v\in V: v.\pi \neq \text{NIL}\\}\cup \{s\}$ and $E_\pi =\\{(v.\pi, v):v\in V_\pi -\\{s\\}\\}$. 
* The predecessor graph is a **breadth first tree** if $V_\pi$ consists of the vertices reachable from $s$ and, for all $v\in V_\pi$, the subgraph $G_\pi$ contains a unique simple path from $s$ to $v$ in $G$. The breadth first tree is in fact a tree since $\vert E_\pi \vert = \vert V_\pi \vert - 1$. We call the edges in $E_\pi$ **tree edges**.
* **Lemma** When applied to a directed or un-directed graph, $G=(V,E)$, procedure BFS constructs $\pi$ so that the predecessor subgraph $G_\pi = (V_\pi, E_\pi)$ is a breadth-first tree. 


## Notes

* The BFS-algorithm also works fine even if we remove the stage at which we color the elements are grey. Thus we can store color (white or black) with one bit memory.
* **Checking if graph is bipartite** using BFS search. A graph is Bipartite if we can divide the vertex set into two sets such that the set elements within the set does not have an edge between them.
  * **Theorem**: A graph $G$ is bipartite if and only if it contain no odd cycles.
  * We can use the above theorem to devise an algorithm, for at each step if there is an neighbour of $u$ such that the color is grey, then, find the sum $u.d+v.d$, if it is odd, then there is an odd cycle. For more details, refer [this](https://www.cs.umd.edu/class/sum2005/cmsc451/bipartite.pdf).
* In a breadth-first search, the value $u.d$ assigned to a vertex $u$ is independent of the order in which the vertices appear in each adjacency list.
* We can modify BFS search procedure to accommodate graph input as adjacency vertices. 

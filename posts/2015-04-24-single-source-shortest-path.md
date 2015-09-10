---
layout: post
comments: true
title: Single source Shortest path 
---

* Given a weighted, directed graph $G(V, E)$, with weight function $w \colon E \rightarrow \mathbb{R}$, which maps every edge into a real number (can be negative). The weight of a path $p = \langle v_0, v_1, \cdots , v_k \rangle$ is given by $w(p)  = \sum w(v_i, v_{i+1})$.
* The shortest path weight between the vertices $u$ and $v$ is denoted by $\delta(u,v)$ and is given by $\min \{w(p): u \rightarrow v \}$, i.e., minimum of the weight of every path from $u$ to $v$, and if no path exists, the value of $\delta(u,v)$ is $\infty$.
* **Optimal substructure**: A shortest path between two vertices contains other shortest path within it. **Lemma**: Given a weighted, directed graph $G = (V, E)$ with weight function $w\colon E\rightarrow \mathbb{R}$, let $p = \langle v_0, v_1, \cdots, v_k \rangle$ be a shortest path form vertex $v_0$ to $v_k$ and, for any $i$ and $j$ such that $0 \le i \le j \le k$, let $p_{ij} = \langle v_i, v_{i+1}, \cdots, v_j\rangle$ be the subpath from the vertex $v_i$ to vertex $v_j$. Then $p_{ij}$ is a shortest path from $v_i$ to $v_j$.
* We do not allow the graph to have negative weighted cycles, if it does have one, then the idea of shortest path becomes vague. Nevertheless, algorithms such as Bellman Ford, shall terminate and will report if there is a negative weighted cycle that is accessible from the source vertex.
* Similarly, we can exclude positive weighted cycles from the shortest path for trivial reasons.
* In order to trace the path, we maintain, for each vertex, a member, $v.\pi$, which denotes the *predecessor* of $v$ in the shortest path.
* Algorithms pertaining to the subject in discussion uses a technique called *relaxation*. Relax(u,v,w) will change the value of $v.d$ to $u.d + w(u,v)$ if there is an edge between $u$ and $v$, from a value $v.d$ such that $v.d > u.d + w(u,v)$. Also, we initialize every vertex's $v.d$ value to $\infty$ at the beginning, except, of course, that of $s.d$ which will be initialized to $0$.

## Properties

* **Triangle inequality**: For any edge $(u,v)\in E$, we have $\delta(u,v) \le \delta(s,u) + w(u,v)$.
* **Upper-Bound property**: We always have $v.d \ge \delta(s,v)$ for all vertices $v\in V$, and once $v.d$ achieves the value $\delta(s,v)$, it never changes.
* **No-path property**: If there is no path from $s$ to $v$, the we always have $v.d = \delta(s,v) = \infty$. 
* **Convergence property**:  If $s\leadsto u \rightarrow v$ is a shortest path in $G$ for some $u,v \in V$, and if $u.d = \delta(s,u)$ any time prior to relaxing edge $(u,v)$, then $v.d = \delta(s,v)$ at all times afterward.
* **Path-relaxation property**: If $p = \langle v_0, v_1, \cdots, v_k \rangle$ is a shortest path from $ s = v_0$ to $v_k$, and we relax the edges of $p$ in the order $(v_0, v_1), (v_1, v_2), \cdots, (v_{k-1}, v_{k})$, then $v_k.d = \delta(s, v_k)$. This property holds regardless of any other relaxation steps that occur, even if they are intermixed with relaxations of the edges of $p$.
* **Predecessor-subgraph property**: Once $v.d = \delta(s,v)$ for all $v\in V$, the predecessor subgraph is a shortest-paths tree rooted at $s$. 

## Bellman-Ford algorithm

{% highlight C%}
BELLMAN-FORD(G, w ,s)
	Initialize-single-source(G, s) //initializes every v.d to positive infinity
	for i = 1 to |G.V|-1
		Relax(u,v,w)
	for each edge (u,v) in G.E
		if v.d > u.d + w(u,v)
			return FALSE
	return TRUE
{% endhighlight %}

* **Lemma**: Let $G= (V, E)$ be a weighted, directed graph with source $s$ and weight function $w \colon E \rightarrow \mathbb{R}$, and assume that $G$ contains no negative-weight cycles that are reachable from $s$. Then, after $\vert V \vert - 1$ iterations of the for loop of BELLMAN-FORD, we have $v.d = \delta(s,v)$ for all vertices $v$ that are reachable from $s$.
* **Corollary**: Let $G = (V, E)$ be a weighted, directed graph with source vertex $s$ and weight function $w \colon E \rightarrow \mathbb{R}$, and assume that $G$ contains no negative-weight cycles that are reachable from $s$. Then, for each vertex $v\in V$, there is a path from $s$ to $v$ if and only if BELLMAN-FORD terminates with $v.d<\infty$ when it is run on $G$.
* **Theorem** (Correctness of the Bellman-ford algorithm). Let BELLMAN-FORD be run on a weighted, directed graph $G = (V, E)$ with source $s$ and weight function $w \colon E \rightarrow \mathbb{R}$. If $G$ contains no negative-weight cycles that are reachable from $s$, then the algorithm returns TRUE, we have $v.d = \delta(s,v)$ for all vertices $v\in V$, and the predecessor subgraph $G_\pi$ is a shortest-paths tree rooted at $s$. If $G$ does contain a negative-weight cycle reachable from $s$, then the algorithm returns FALSE. 

* **Notes**:
  * Given a weighted, directed graph $G=(V,E)$ with no-negative weight cycles, let $m$ be the maximum over all vertices $v\in V$ of the minimum number of edges in a shortest path from the source $s$ to $v$. Then if we modify the BELLMAN-FORD algorithm such that a flag is set to $1$ if at least one call to relax is given and the flag is re-initialized to $0$ at each iteration. If we write the for loop so that it checks whether the flag value of the previous iteration is $0$ (implying termination). This algorithm will terminate in $m+1$ passes.
  * The time complexity of BELLMAN-FORD algorithm is $\mathcal O (\vert V \vert\cdot \vert E \vert)$. 

## Single-source shortest paths in directed acyclic graphs

* Shortest paths are well defined in a DAG (since there are no cycles!).
* The algorithm starts by Topologically sorting the DAG.

{% highlight C %}
DAG-SHORTEST-PATH(G, w, s)
 topologically sort the vertices of G
 INITIALIZE-SINGLE-SOURCE(G,s)
 for each vertex u, taken in topologically sorted order
   for each vertex v in G.adj[u]
     RELAX(u,v,w)
{% endhighlight %}

* The **running time** is $\Theta (V+E)$.
* **Theorem**: If a weighted, directed graph $G = (V,E)$ has source vertex $s$ and no cycles, then at the termination of the DAG-SHORTEST-PATHS procedure, $v.d = \delta(s,v)$ for all vertices $v\in V$, and the predecessor subgraph $g_\pi$ is a shortest-paths tree.


## Dijkstra's Algorithm

* Dijkstra's algorithm solves the single-source shortest paths problems on a weighted directed graph $G=(V,E)$ for the case in which *all edge weights are nonnegative*.
* The running time of Dijkstra's algorithm is lower than Bellman Ford algorithm.

{% highlight C %}
DIJKSTRA(G, W, s)
	INITIALIZE-SINGLE-SOURCE(G, s)
	S = empty-set
	Q = G.V
	while Q is not empty
		u = EXTRACT-MIN(Q)
		S = S union {u}
		for each vertex v in G.Adj[u]
			RELAX(u,v,w)
{% endhighlight %}

* **Theorem**: Dijkstra's algorithm, run on a weighted, directed graph $G = (V,E)$ with non-negative weight function $w$ and source $s$, terminates with $u.d = \delta(s,u)$ for all vertices $u\in V$.
* The above theorem can be easily shown with the help on induction where the loop invariant is: *At the start of each iteration of the while loop, $v.d = \delta(s,v)$ for each vertex $v\in S$*.
* If the queue is implemented using a priority queue, then the running time of the algorithm is $\mathcal O ( E\lg V)$. We can improve the running time to $\mathcal O (V\lg V + E)$ by using Fibonacci heap. 

### Notes
* The Dijkstra's algorithm need not produce the correct answer when the edge weight can become negative.


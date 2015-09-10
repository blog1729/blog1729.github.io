---
layout: post
title: Representing Graphs
comments: True
---

* Graphs can be represented mainly represented in two different ways,
  * **Adjacency list** representation of a graph $G = (V, E)$ consists of array `Adj` of $\vert V \vert$ lists, one for each vertex in $V$. For each $u\in V$, the adjacency list $Adj[u]$ consists of all vertices $v$ such that there is an edge $(u,v)\in E$.
  * **Adjacency matrix** representation of a graph $G = (V, E)$ is where we represent the graph as a matrix that is defined as follows

$$a_{ij} = \left\{ \begin{array}{c c} 1 & \text{if } (i,j) \in E \\ 0 & \text{otherwise} \end{array} \right.$$

### Space complexity of representation

* The adjacency matrix requires $\Theta(V^2)$ memory while adjacency list requires $\Theta(V+E)$.
* The adjacency list is usually preferred when the graph is sparse, i.e., when $V+E$ is very less than $V^2$ and vice-versa. 

## Algorithm for finding universal sink

A **universal sink** in a directed graph without any loops or multiple edges is a vertex with in-degree $\vert V\vert-1$ and an out-degree $0$. The problem is to find if there is a universal sink in a given graph, provided it's representation in adjacency-matrix form. There exists algorithm that can solve this in a time complexity of $\mathcal O(\vert V\vert)$. 

The following bullets summarize the algorithm, suppose $A$ be the graph in adjacency matrix representation, then:

1. Start at $A[1,1]$
2. Let the current position be $A[i, j]$
3. If $A[i,j]$ is $0$, then the next position is $A[i, j+1]$
4. If not, then the next position is $A[i+1, j]$
5. If either ends have not been reached, go back to step 2.
6. If the end if reached, and let the column number of the current position be $i$, then start from $A[i,1]$ and scan till $A[i,N]$, if at least one of them is $1$, then the graph does not contain a universal sink and if all of them are zeros, then the graph will contain a universal sink.

### Correctness

The correctness of the algorithm is easy and can be easily constructed find out the following two observations, let us assume that $i$ is the label of the universal sink (and it exists):

* The $i$th row of the adjacency-matrix will contain only zeros.
* The $i$th column of all other rows except $i$th row will contain only ones. 


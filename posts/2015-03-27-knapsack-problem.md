---
layout: post
title: Knapsack problem
comments: True
---

There are two forms of the Knapsack problem, one is the $0-1$ knapsack problem and fractional knapsack problem. The $0-1$ knapsack problem is a widely used counter-example that the greedy strategy wouldn't always work, while the fractional knapsack problem has a greedy solution.

## $0-1$ Knapsack problem

There are $n$ items and the $i$th item is worth $v_i$ dollars and weights $w_i$ pounds ($v_i$ and $w_i$ are integers). You cannot carry more than $W$ weight in the Knapsack, where $W$ is also an integer. The problem is to find out what items one should take.

One can use dynamic programming to solve the $0-1$ Knapsack problem and also construct an easy counterexample to show that the greedy strategy can fail in this case. The dynamic programming algorithm takes $O(nW)$ time.

## Fractional Knapsack problem

The setup for this is the same as $0-1$ Knapsack problem, but in this case we can take a fraction of the item too.

### Algorithm

The algorithm is as follows

* Find $v_i/W_i$ for every item and pick the maximum amount that can be taken for the element with highest value of the ratio.
* If we can carry more weight, repeat the process for the remaining  elements, otherwise stop.

The above algorithm is, of course, greedy (this algorithm fails for the $0-1$ knapsack problem). The running time of the algorithm is $\mathcal O (n^2)$. 

## Notes

* By fusing with the strategy we used for quick sort, we can improve the running time of the fractional Knapsack problem to $\mathcal O(n)$. (See the following [Computer Science beta StackExchange discussion](http://cs.stackexchange.com/questions/11620/fractional-knapsack-in-linear-time)). 
* Given a set of points $\{x_1, \cdots, x_n\}$ on real line, to determine the smallest set of unit-length close intervals that contains all of the given points, we can use the following method:
  * Find the minimum out of all the points, call is $z$.
  * Consider the closed interval $[z, z+1]$, remove all the points in $\{x_1, \cdots, x_n\}$ that belong to this closed interval and call the set $S$.
  * Repeat the same process to $S$ until $S$ becomes empty.

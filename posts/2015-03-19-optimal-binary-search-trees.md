---
layout: post
comments: True
title: Optimal Binary Search Trees
---

We are given a seqence $K = \langle k_1, \cdots, k_n \rangle$ of $n$ distinct keys in sorted order and we wish to build a binary search tree out of these keys. For each key, $k_i$, we have a probability $p_i$ that the search will be for $k_i$. So we have the following inequality (we assume that there are searches for members other than that in the given sequence). 

$$ \sum p_i \le 1$$

The expected cost of a tree $T$ can thus be defined as

$$ E[\text{search cost in } T] = \sum(\text{depth}_T(k_i)+1) + \sum (\text{depth}_T(k_i)+1).$$

For a given set of probabilities, we wish to construct a binary search tree whose expected search time is the lowest. We call such a tree as **optimal binary search tree**.

* * *

## Recursive relation and Dynamic algorithm

We assume that there are no dummy keys and proceed to form an algorithm. The optimal sub-structure for this problem is sub-trees. Let us use $C[i,j]$ to denote the search time of binary tree consisting of elements $\{i, i+1, \cdots, j\}$. Then one can easily see that

$$ C[i,j] = \max_{i\le r \le j}\left\{ \sum_{k=i}^{j}{p_k} + C[i,r-1]+ C[r+1, j] \right\}$$ 

Thus, the algorithm is clear, create a two-dimensional array fill the array in a bottom up fashion. It should be noted that the first summation in the recursive relation is constant for $r$ under the given constraint. 

## Complexity

* The time complexity of the above algorithm is $\Theta (n^3)$.
* **Trivia**: There is an advanced algorithm that has complexity $\Theta (n^2)$. 

* * *
**Note**:

* There is no known greedy algorithm for this problem. In particular, the following ones can be easily observed: 
  * The optimal binary search tree *need not* be a tree with the smallest height.
  * The optimal binary search tree *need not* be a tree with such that the node of highest probability occurs at the root.
  * The optimal binary search tree *need not* be the tree such that the node with lest probability is the deepest node. 
* The brute force algorithm takes exponential time (the algorithm that calculate the expected search time of all such binary search trees).






---
layout: post
title: Dynamic Programming algorithm for Longest Common Subsequence
comments: True
---

* Given a sequence $X = \langle x_1, x_2, \cdots, x_n \rangle $, another sequence $Z = \langle z_1, \cdots, z_k \rangle$ is said to be **subsequence** of $X$ if there exists a strictly increasing sequence $\langle i_1, \cdots, i_k \rangle$ of indices of $X$ such that $j=1, 2, \cdots, k$ such that $x_{i_j} = z_j$. 
* In the longest common subsequence problem, given two sequences $X$ and $Y$, we wish find a maximum length common subsequence of $X$ and $Y$.
* **Theorem** Let $X= \langle x_1, \cdots, x_n \rangle$ and $Y = \langle y_1, y_2, \cdots, y_m\rangle$ be sequences, and let $Z = \langle z_1, \cdots, z_k \rangle$ be any Longest Common Subsequence of $X$ and $Y$. Then
  1. If $x_m = y_n$, then $z_k = x_m = y_n$ and $Z_{k-1}$ is a LCS of $X_{m-1}$ and $Y_{m-1}$.
  2. If $x_m \neq y_n$, then $z_k \neq x_m$ implies that $Z$ is a LCS of $X_{m-1}$ and $Y_n$.
  3. If $x_m \neq y_n$, then $z_k \neq y_n$ implies that $Z$ is a LCS of $X_{m}$ and $Y_{n-1}$
* The above theorem paves road for an optimal substructure.
* **Recursive solution**: Let $c[i,j]$ denote the length of the LCS for sequences $X_i$ and $Y_i$, then $c[i,j]$ will follow the following recursion:
  $$c[i,j] = \left \{ \begin{array}{c c}
  0 & \text{if } i = 0 \text{ or } j=0, \\
  c[i-1, j-1] + 1 & \text{if } i,j >0 \text{ and } x_i = y_i \\
  \max \{ c[i,j-1], c[i-1, j] \} & \text{if } i,j>0 \text{ and } x_i \neq y_j.
  \end{array} \right.$$
* Using dynamic programming, we can easily construct a solution to the problem that takes a time complexity of $\Theta(mn)$. To re-construct the solutions to the problem, one can create an additional array that stores if the $c[i,j]$ was formed by adding 1 or points to the maximum element in the sub-structure. But in fact, as an optimization, one can avoid this and this detail can be re-constructed from the table.

## Notes

* To find the longest monotonically increasing subsequence of a sequence of $n$ numbers, one can implement a $\mathcal O(n^2)$ algorithm that simply finds the LCS of the given sequence and the same sequence after sorting. (I'm told that one can improve the complexity to $O(n \lg n)$.)
* The algorithm to reconstruct the LCS takes a complexity of $\mathcal O(m+n)$. 

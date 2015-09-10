---
layout: post
title: Algorithm for Matrix chain multiplication
comments: True
---

This is a nice application of *dynamic programming*. Suppose, we are given a sequence (chain) $\langle A_1, \cdots, A_n \rangle$ of $n$ matrices to be multiplied and we wish to compute the product

$$ A_1A_2\cdots A_n$$

We can evaluate the above matrix by using the standard algorithm which takes time of the order $pqr$ for multiplying matrices of order $A_{p\times q}$ and $B_{q\times r}$. Since multiplication is associative, i.e., $A(BC) = (AB)C$. The same thing evaluated in different ways can differ in time. The goal is to minimize the total time at which the algorithm executes.

We use parenthesis to denote the order in which matrices are multiplied. For example, $(AB)(CD)$ and $(ABC)D$ denote two ways in which we can parenthesize $ABCD$. Here $p_{i-1} \times p_{i}$ denotes the order of the matrix $A_i$. 

### Counting the number of parenthesizations

Let $P(n)$ denote the number of ways in which one can parenthesize a $n$ element matrix chain. Clearly $P(1) = 1$ and $P(n)$ follows the following recurrence relation

<div>
$$P(n) = \left\{\begin{array}{cc}1 & n = 1 \\\sum\limits_{k=1}^{n-1} P(k) P(n-k) & n \ge 2\end{array}\right.$$</div>

One can show that $P(n) = \Omega ( 4^n / n^{3/2})$. But using dynamic programming, we can design an algorithm that does the same in polynomial complexity.


### Using Dynamic programming

Let us denote the matrix chain by $A_1 \cdots A_n$ and $m[i,j]$ denote the minimum number of multiplications that we have to do in order to multiply the matrices $A_i\cdots A_j$. Clearly $m[i,i] =0'$. Then $m[i,j]$ follows the following recurrence relation
<div>
$$ m[i,j] =\left\{
\begin{array}{cc}
0 & i = j \\
\min_{i \le k < j}\{ m[i,k] + m[k+1, j] + p_{i-1}p_{k}p_{j}\} & i<j 
\end{array}
\right.
$$</div>

Then $m[1,n]$ gives the cost of the optimal solutions to sub-problems. In order to trace the solution, we use another array $s[i,j]$ where $s[i,j]$ contains that value of $k$ for which the cost was minimum. Now, dynamic programming can be applied in a bottom-up fashion.


## Notes

* A full parenthesization of an $n$-element expression has exactly $n-1$ pairs of parenthesis. This can be easily proved by using recursion.

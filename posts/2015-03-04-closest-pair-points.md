---
layout: post
title: Algorithm for finding closest pair of points
comments: True
---

## 1 Dimensional case
In a 1 dimensional case, the algorithm is easy. One can sort $n$ points in $\Theta(n\lg n)$ time and then spend linear time to find the minimum distance between adjacent points. But this becomes tricky in 2 dimensional case.

## 2 Dimensional case

The distance between two points $(x_1, y_1)$ and $(x_2, y_2)$ is given by 

$$ \sqrt{(x_1-x_2)^2 + (y_1-y_2)^2} $$

Here there is a brute force algorithm that runs in $\Theta(n^2)$. But we can use the divide and conquer design paradigm to devise an algorithm that runs in $\Theta(n\lg n)$.

### Method

We have input, a 2 set $P$ of 2-dimensional points. We sort the points according to the $x$ coordinate and save it in array $X$, similarly sort the points according to the $Y$ coordinate and save it in the array $Y$. Consider this as a pre-processing step which is going to take $\mathcal O(n\lg n)$ time.

As usual, we need to split the problem into two sub-problems, solve the sub-problem and *somehow* use the solutions of the two sub-problems to arrive at the solution. Here the recursion ends when the number of elements in $P$ is less than or equal to $3$ (in this case use Brute-force method to sort).

**Divide**: Divide points of $P$ into almost two. In order to do this, find the median of the sorted array $X$ and $P_l$ shall consists of points whose $x$ coordinate lies in the left side of median, similarly $P_r$ be points whose $x$ coordinate lies in the right side of the median.

Given the split of $P$ into $P_l$ and $P_r$, it is easy to split $X$ into $X_l$ and $X_r$ (actually nothing to do). We also want to split the points of $Y$ into two, $Y_l$ and $Y_r$. We use the fact that $Y$ is a sorted according to $y$ co-ordinate to devise a linear time algorithm.

**Algorithm**

{% gist 0dd5080962e82547175d %}

**Conquer**  Having divided $P$ into $P_l$ and $P_r$, we make two recursive calls, one to find the closest pair of points of $P_l$ and another one to find the closest pair of points in $P_r$. The inputs to the first call are the subset $P_l$ and arrays $X_l$ and $Y_l$; the second call inputs $P_r, X_r,$ and $Y_r$. Let the closest-pair distances for $P_l$, returned for $P_l$ and $P_r$ be $\delta_l, \delta_r$ respectively, and let $\delta = \min \{ \delta_l, \delta_r\}$.

**Combine** We see that the closest pair is either the pair returned by the left recursive call or the right recursive call or a pair of points in which one lies on the left side of the line and the other on the right side. We shall devise a linear time algorithm to find the minimum distance point satisfying this criteria.

Observe that the pair must be at a maximum distance of $\delta$ units from the vertical line.

- Create an array $Y'$, which is array $Y$ with all points not in $2\delta$-wide vertical strip removed. The array should be sorted according to the $y$-coordinate, just as $Y$ is. One can devise a linear time algorithm to do this step--remove element if the $x$ coordinate is at a distance more than $\delta$ from the median line.

- For each point $p$ in the array $Y'$, try to find points in $Y'$ that are within $\delta$ units of $p$. We claim that one can achieve a linear time algorithm to do this step; only the $7$ points that follow $p$ need to be considered and keep track of the closest-pair distance $\delta'$ found over all pairs of points in $Y'$.

The mystery associated with the number $7$ can be easily proved. Imagine a $2\delta \times \delta$ rectangle inside the $2\delta$ strip with point $p$ at bottom edge of the rectangle. Divide it into $8$ equal squares of dimension $\delta/2$. Firstly, one can immediately see that each square can contain at most one point. Secondly, apply pigeonhole principle. So this rectangle contains at most $8$ points. Excluding $p$, there can be a total of $7$ points and as $Y'$ is sorted according to the $y$-coordinate, we are golden. 

- If $\delta'<\delta$, then the vertical strip does indeed contain a closer pair than the recursive calls. Return this pair and the distance $\delta'$. Otherwise return the closest pair found by recursion and the distance $\delta$.

## Time complexity

If running time is $T(n)$, we see that 

$$ T(n) = 2T(n/2) + \mathcal O(n)$$

and therefore $T(n) = \mathcal O(n\lg n)$.
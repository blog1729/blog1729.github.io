---
layout: post
title: Activity selection problem
comments: True
---

Suppose, we have a set $S = \{a_1, \cdots, a_n\}$ of $n$ proposed activities that we wish to use a resource, which can serve only one activity at a time. Each activity $a_i$ has a start time $s_i$ a start time $s_i$ and a finish time $f_i$, where $0 \le s_i \le f_i <\infty$. We assume that the activities are sorted in a monotonically increasing order, i.e., $f_1 \le f_2 \le \cdots $. Activities $a_i$ and $a_j$ are compatible if the intervals $[s_i, f_i)$ and $[s_j, f_j)$ do not overlap. In the activity selection problem, we wish to select a maximum-size subset of $S$ of mutually compatible activities.

There is, clearly, a dynamic programming algorithm for the activity selection problem. But this can also be done using greedy algorithm.

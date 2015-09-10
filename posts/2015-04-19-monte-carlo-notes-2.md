---
layout: post
comments: true
title: Monte-Carlo Simulation Notes-2
---

## Low discrepancy random numbers

* Given a collection $\mathcal A$ of Lebesgue measurable subset of $[0,1)^d$, the discrepancy of the point set $\{x_1, \cdots, x_n \}$ relative to $\mathcal A$ is

$$ D(x_1,\cdots, x_n; \mathcal A) = \sup_{A \in \mathcal A} \left\vert \frac{\#\{x_i \in A\}}{n} - \text{vol} A \right\vert.$$

* The aim is to generate sequences whose deviation from "uniformity" is minimal, i.e., discrepancy is minimal.

* **Radical inverse function**: For $i = 1, 2, \cdots,$ let $i = \sum_{i=0}^{j} d_k b^K$, be the expression in base $b$ (integer $\ge 2$) with digits $d_k\in \{0, 1, \cdots, b-1 \}$. Then the radical inverse function is defined by

$$ \phi_{b}(i) = \sum_{k=0}^{j}{b_k d^{-k-1}}$$

* **Van Der corput sequences** is defined by $x_i = \phi_2(i)$.
* **Halton Sequences**: Let $p_1,\cdots, p_n$ be pairwise prime integers. The Halton sequence is define as the sequence of vectors

$$x_i := (x_{p_1}(i), \cdots, x_{p_n}(i))$$

* * *
* **Central limit theorem**: Let $X_1, X_2, \cdots$ be a sequence of identical and independent random variables, each with mean $\mu$ and variance $\sigma^2$ and let $S_n = \sum\limits_{i=1}^{n}X_i$. Then for large $n$, $S_n$ behaves like $\mathcal(n\mu, n\sigma^2)$, which in other words means that $\frac{S_n - n\mu}{\sigma \sqrt{n}}$ is approximately $\mathcal{N} (0, 1)$.

## Confidence intervals

* The sample mean $\mu_M$ and the sample variance $\sigma_M$ of a sample of $M$ elements is defined by $\mu_M = \frac1 M \sum_{i=1}^{M} x_i$ and $\sigma_M^2 = \frac{1}{M-1} \sum_{i=1}^{M} (x_i - \mu_M)^2$. 
* Suppose that $P(a \le X \le b) = 0.95$, we say that the interval $[a,b]$ is $95\%$ interval for $X$.
* If $X \sim \mathcal N (\mu, \sigma^2)$, one can see that the interval $[ a_M - \frac{1.96 b_M}{\sqrt{M}}, a_M + \frac{1.96 b_M}{\sqrt{M}}].$ is the $95\%$ confidence interval. The analysis leads to the basic Monte-carlo approximation of $\mu$. 

* * *

* There are methods in which one can reduce the variance in the Monte-Carlo approximation. One such method is known as using antithetic variates.
* Example in the case of uniform random variable. Suppose we want to estimate $E[\exp(\sqrt{u})]$ where $u \sim \mathcal U (0,1)$, then instead of taking sample mean $I_M = \frac{1}{M} \sum Y_i$, one can take $\hat{I_M} = \frac{1}{M} \sum \hat{Y_i}$ where $\hat{Y_i} = \frac{\exp(\sqrt{1-u}) + \exp(\sqrt{u})}{2}$ where $u \sim \mathcal U (0,1)$. And it can be shown that the variance reduces by a factor or $\approx 181$.

* **Result**: Suppose that $f$ and $g$ are both monotonic increasing or both monotonic decreasing functions, then, for any random variable $X$, $\text{Cov}(f(X), g(X)) \ge 0$.

## Analysis of uniform case

* To approximate $I = E[f(U)]$ where $U \sim \mathcal U[0, 1]$ for some function $f$, instead of the standard Monte-Carlo estimate $I_M = \frac{1}{M} \sum f(U_i)$, we can use $\hat{I_M} = \frac{1}{M} \sum \frac{f(U_i) + f(1-U_i)}{2}$.
* **Result**: If $f$ is monotonic, then we can see that $\text{Var}\, \left(\frac{f(U_i) + f(1-U_i)}{2} \right) \le \frac{1}{2} \text{Var}\, (f(U_i))$. 

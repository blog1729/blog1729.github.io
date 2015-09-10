---
layout: post
title: Binomial model
comments: True
---

This model is widely used in modelling stock prices. The following are the basic conditions that this model has to satisfy

* The one step returns $K(n)$ on a stock are identically distributed independent random variables such that
<div>
$$ K(n) = \left\{ \begin{array}{cc} u & \text{with probability } p \\
d & \text{with probability } 1-p \\ \end{array} \right.$$</div>

* The one-step return $r$ on a risk-free investment is the same at each time step and $d<r<u$.

One can show that $S(n)$ can have values $S(0)(1+u)^i(1+d)^{n-i}$ with probaility $\binom{n}{i} p^i(1-p)^{n-i}$. The number $i$ is the number of upward price movements in a random variable and $n-i$ is the number of downward movements.

## Risk Neutral probability

One can show that $E(S(1)) = S(0)(1+E(K(1))$ where $E(K(1))= pu+(1-p)d$ and generalize the result for $n$ stocks are follows

$$E(S(n))=S(0)(1+E(K(1))^n. $$

If $r$ represents the risk-free rate of return, then one can expect that $E(K(1))$ is greater than $r$. But there are cases in which $E(K(1)) = r$, and we refer this case as risk-neutral. In this case, we call the probability as $p_{*}$. One can easily show that

$$p_{*} = \frac{r-d}{u-d}.$$




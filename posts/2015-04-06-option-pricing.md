---
layout: post
title: Option Pricing
comments: True
---

* We define a random variable of the form $D(T) = f(S(T))$, where $f$ is a given function called *payoff* with stock $S$ as underlying asset, as a *European derivative security* or *contingent claim*.
* It is possible to replicate any contingent claim $D(T)$ by a replicating strategy, that is, an admissible strategy $x(t), y(t)$ with final value $V(T) = D(T)$. Then the price $D(0)$ of the contingent claim at time $0$ must be equal to that of the replicating strategy, $V(0) = D(0)$.
* The above theorem also solves the problem of hedging for an option writer, i.e., if the cash involved in writing the option is invested in the replicating strategy, all the risk associated with writing an option can be eliminated.
*

## European options in the Binomial tree model

Refer to [Binomial model]({% post_url 2015-04-02-binomial-model %}).

### One step

* Recall that $S_u = S(0)(1+u)$ and $S_d = S(0)(1+d)$
* Let $x(1)$ be the amount invested in stock and $y(1)$ be the amount investment with a fixed payoff of $1+r$, then the replicating portfolio shall satisfy
<div>
$$ \left \{ \begin{array}{cc} x(1)S_u + y(1)(1+r) & = f(S_u) \\
x(1)S_u + y(1)(1+r) & = f(S_d) \\ \end{array}
\right.$$ 
</div>

* By solving the above equation, one can see that $x(1) = \frac{f(S_u) - f(S_d)}{S_u - S_d}$, which is the replicating position in the stock, called **delta** of the option. We can also see that the money market position is $y(1) = \frac{(1+u)f(S_d) - (1+d)f(S_u)}{(u-d)(1+r)}$.
* Thus $D(0) = x(1)S(0) + y(1)$.
* Recall that the risk-neutral probability is given by $p_{*} = \frac{r-d}{u-d}$. 
* **Theorem**: The expectation of the discounted payoff computed with respect to the risk-neutral probability is equal to the present value of the contingent claim, i.e., $D(0) = \frac{1}{1+r}E(f(S(1))$.

### Two steps

* One can easily extend the model to suit two steps. In this case there are three possibilities, i.e., $S_{uu}$, $S_{ud}$, $S_{dd}$.
* Similarly, we can show that $D(0) = \frac{1}{(1+r)^2} E(f(S(2))$ where the expectation involved the risk-neutral probability.

### General $N$-step model

The formula for $D(0)$ in an $n$ step model is

$$ D(0) = \sum\limits_{k=0}^{N} \binom{N}{k} p^k_{*}(1-p_{*})^{N-k} f(S(0)(1+u)^{k}(1+d)^{N-k})$$

* **Theorem** The value of a European derivative security with payoff $f(S(N))$ in the $N$-step binomial model is the expectation of the discounted payoff under the risk-neutral probability: $D(0) = E((1+r)^{-N}f(S(N))$.

## Cox-Ross-Rubinstein Formula

Let the payoff of a call option with strike price $X$ satisfies $f(x) = 0$ for $x \le X$, which reduces the number of terms in the summation formula given in the previous section. Let $m$ be the smallest non-negative integer such that $S(0)(1+u)^m(1+d)^{N-m}>X$. Hence $$C_E(0) = (1+r)^{-N}\sum\limits_{k=m}^{N}\binom{N}{k}p^K_{*}(1-p_{*})^{N-k}\left(S(0)(1+u)^{k}(1+d)^{N-k} - X \right).$$

Further, the expressions of $x(1)$ and $y(1)$ are as follows

$$ \begin{align}
x(1) &= \sum\limits_{k=m}^{N}\binom{N}{k}\left(p_{*}\frac{1+u}{1+r}\right)^k \left((1-p_{*})\frac{1+d}{1+r}\right)^{N-k}\\
y(1) &= -X (1+r)^{-N} \sum\limits_{k=m}^{N}\binom{N}{k} p_*^{k}(1-p_*)^{N-k}
\end{align}$$

If we define $q = p_{*}\frac{1+u}{1+r}$, we can simplify the expression of $x(1)$.

* Let $\Phi(m,N,p)$ denote the cumulative binomial distribution with $N$ trials and probability $p$ of success in each trial, $\Phi(m,N,p) = \sum_{k=0}^{m}\binom{N}{k} p^k(1-p)^{N-k}$.
* **Theorem** the price of European call and put option with strike price $X$ to be exercised after $N$ time steps is given by

$$ \begin{align}
C_E(0) &= S(0)[1-\Phi(m-1, N, q)] - (1+r)^{-N}X[1-\Phi(m-1, N, p_{*})] \\
P_E(0) &= -S(0)\Phi(m-1, N, q) + (1+r)^{-N} X \Phi(m-1, N, p_{*}) \\ \end{align}$$ 

* The initial replicating portfolio $x(1)$ and $y(1)$ is given by:

$$ \begin{array}{c| c| c}
& x(1) & y(1) \\ \hline
\text{for a call} & 1-\Phi(m-1, N, q) & -(1+r)^{-N}X[1-\Phi(m-1, N, p_{*})] \\
\text{for a put} & -\Phi(m-1, N, q) & (1+r)^{-N}X \Phi(m-1, N,p_{*})
\end{array}$$

### American options in the Binomial tree model




* * *


## Notes

* For $n$ step binomial model, there will be $n+1$ columns in tree model of stock price (including the initial stock price). 

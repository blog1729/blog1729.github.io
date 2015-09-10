---
layout: post
title: Portfolio Management
comments: True
---

The return on a risky invesment may be measured using the expected value or $E(X)$, where $X$ is the random varaible that represent the amount of money to be received at the end. Risk may be measured by the variance of the random variable corresponding to return. Alternatively, one can also use the standard deviation which in certain cases is more convenient (when compared to variance) since the unit is same as the unit of return.

## Two securities

Let us prepare a portfolio $V$ whose value at time $t$ is given by $V(t)$ and consider two stocks $S_1$ and $S_2$ whose values at time $t$ is represented by $S_1(t)$ and $S_2(t)$ and define weights $w_1$ and $w_2$ by 
$$ w_1 = \frac{x_1 S_1(0)}{V(0)}, \quad w_2 = \frac{x_2 S_2(0)}{V(0)},$$ 
where $x_1$ and $x_2$ are share numbers of stock $1$ and stock $2$.

One can easily observe that $w_1+w_2 = 1$. If short-selling is allowed (borrowing of stock), the value of one of the weight can be negative and the other greater than $100%$.

<blockquote>
<b>Proposition</b>

The return $K_v$ on a portfolio consisting of two securities is the weighted average
$$K_v = w_1K_1 + w_2K_2,$$
where $w_1$ and $w_2$ are the weights and $K_1$ and $K_2$ the returns on the two components.
</blockquote>

The proof of the above proposition is trivial and hence omitted. Similarly, one can easily see the following equation regarding the expected return
$$ E(K_V) = w_1E(K_1)+w_2E(K_2).$$

<blockquote>


The variance of the return on a portfolio is given by
$${\operatorname{Var}}(K_V) = w_1^2 {\operatorname{Var}}(K_1) + w_2^2{\operatorname{Var}}(K_2) +  2w_1w_2{\operatorname{Cov}}(K_1,K_2).$$
</blockquote>

<blockquote>
<b>Theorem</b>

The variance $\sigma^2_V$ of a portfolio cannot exceed the greater of the variances $\sigma_1^2$ and $\sigma_2^2$ of the components,
$$\sigma_v^2 \le \max\{\sigma_1^2, \sigma_2^2\},$$
if short sales are not allowed.
</blockquote>

The proof of the above theorem easily follows from the fact that ${\operatorname{Cov}}(K_1,K_2) \le \sigma_1\sigma_2$. If short-selling is allowed there are examples for which the theorem is not true.

<blockquote>
If $\rho_{12}=1$, the correlation coefficient is $1$, then we can achieve $\sigma_v = 0$ when $\sigma_1 \neq \sigma_2$ under the weights
$$ w_2 = -\frac{\sigma_2}{\sigma_1 - \sigma_2}, \quad w_2 = \frac{\sigma_1}{\sigma_1 - \sigma_2}$$
(Short sales are necessary, since either $w_1$ or $w_2$ are negative.)

If $\rho_{12}=-1$, then $\sigma_V = 0$ for 
$$w_1 = \frac{\sigma_2}{\sigma_1+\sigma_2}, \quad w_2 = \frac{\sigma_1}{\sigma_1+\sigma_2}.$$
(No short sales are necessary, since both $w_1$ and $w_2$ are positive.)
</blockquote>

The last theorem can be easily verified.

* If we take $s=w_2$ as a parameter, then we see that

$$\begin{align}
\mu_{V} & = (1-s)\mu_1 + s \mu_2 \\
\sigma^2_V & = (1-s)^2 \sigma_1^2 + s^2 \sigma_2^2 + 2s(1-s)\rho_{12}\sigma_1\sigma_2. \\
\end{align}$$

* **Theorem**. For $-1 < \rho_{12} < 1$ the portfolio with minimum variance is attained at $s_0 = \frac{\sigma_1^2 - \rho_{12}\sigma_1 \sigma2}{\sigma_1^2 + \sigma_2^2 - 2 \rho_{12}\sigma_1\sigma_2}$. If short sales are not allowed, then the smallest variance is attained at

$$ s_{\text{min}} = \left\{ \begin{array}{cl} 0 & \text{if } s_0 < 0 \\
s_0 & \text{if } 0 \le s_0 \le 1, \\
1 & \text{if } 1<s_0.
\end{array}\right.$$

* **Corollary**: Suppose that $\sigma_1 \le \sigma_2$. Then the following three cases are possible
  1. If $-1 \le \rho_{12}\le \frac{\sigma_1}{\sigma_2}$, then there is a portfolio without short-selling such that $\sigma_V < \sigma_1$.
  2. If $\rho_{12} = \frac{\sigma_1}{\sigma_2}$, then $\sigma_V \ge \sigma_1$ for each portfolio.
  3. If $\frac{\sigma_1}{\sigma_2} \le \rho_{12} < 1$, there is a portfolio with short selling such that $\sigma_V < \sigma_1$, but each portfolio without short selling will have $\sigma_V \ge \sigma_1$.
* **Proposition**. The standard deviation $\sigma_V$ of a portfolio consisting of a risky security with expected return $\mu_1$ and standard deviation $\sigma_1>0$, and a risk-free security with return $r_F$ and standard deviation zero depends on the weight $w_1$ of the risky security as $\sigma_V = \vert w_1\vert\sigma_1$. 

## Several securities

* A portfolio constructed from $n$ different securities can be described in terms of their weights $w_i = \frac{x_i S_i(0)}{V(0}$, $i  = 1, \cdots, n$.
* ${\bf w } = [w_1\ w_2 \ \cdots \ w_n ]$ be the weight matrix. Then if ${\bf u} = [1 \ 1 \ \cdots 1]$, then $1 = \bf{uw^{T}}$. 
* Let ${\bf m} = [\mu_1 \ \mu_2 \ \cdots \ \mu_n ]$ and let $\bf C$ be the Covariance matrix where $c_{ij}  = \operatorname{Cov}{(K_i, K_j)}$.
* **Theorem**. $\mu_V = \bf{mw^{T}}$ and $\sigma_V^2 = \bf wCw^{T}$. 
* **Proposition** (Minimum variance portfolio). The portfolio with the smallest variance in the attainable set has weights $\bf w = \frac{uC^{-1}}{u C^{-1}u^{T}}$.
  * The above proposition is proved by using method of Lagrange multipliers, where the function to be maximized is $F({\bf w}, \lambda) = {\bf w Cw^{T}}-\lambda{\bf uw^{T}}$.
* **Proposition** (Minimum variance line). The portfolio with the smallest variance among attainable portfolios with expected return $\mu_V$ can be found out by maximizing $G({\bf w}, \lambda, \mu) = {\bf wCw^{T}} - \lambda{\bf u w^{T}} - \mu{\bf mw^{T}}$.

## Efficient frontier

* We say that a security with expected value $\mu_1$ and standard deviation $\sigma_1$ *dominates* another security with expected value $\mu_2$ and standard deviation $\sigma_2$ whenever $\mu_1 \ge \mu_2$.
* A portfolio is called efficient if there is no other portfolio, except itself, that dominates it. The set of efficient portfolios among all attainable portfolios is called *efficient frontier*. 
* Take any two portfolios on the minimum variance line, with weights $\bf w'$ and $bf w''$. Then the minimum variance line consists of portfolios with weights $c{\bf w'} + (1-c){\bf w''}$ for any $c\in \mathbb{R}$ and only such portfolios.
* The weights of any portfolio belonging to the efficient frontier (except for the minimum variance portfolio) satisfy the condition $\gamma {\bf w C} = {\bf m } - \mu{\bf u}$ for some real numbers $\gamma$ and $\mu$. 

## Capital asset pricing model

* The *capital market line* joining the risk free-security and the market-portfolio satisfies the equation: $\mu = r_F + \frac{\mu_M - r_F}{\sigma_M} \sigma$.
* The market-portfolio is a portfolio with standard deviation $\sigma_M$ and expected return $\mu_m$, and has to contain all risky securities with weights equal to their relative share in the market.
* 

## References

1. Mathematics for finance, Marek Capinski and Thomasz Zastawniak.

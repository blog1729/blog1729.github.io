---
layout: post
title: Options General Properties
comments: True
---

## Definitions

* **European call option** is a contract giving the holder the right to **buy an asset**, called the underlying, for a price $X$ fixed in advance, known as *exercise price* or *strike price*, at a specified time $T$, called the *exericse* or *expiry* time. Similalry, a *European put* option gives the right to sell the underlying asset for the strike price $X$ at the exercise time $T$.

* **American call option** or put option gives the right to buy or, respectively, to sell the underlying asset $X$ for the strike price $X$ at any time between now and a specified future time $T$, called the *expiry time*.

* **Underlying asset**: Apart from the typical assets such as stocks, commodities, or foreign currency, there are options on stock indices, interest rates, or even the snow level at a ski resort. Some underlying asset may be impossible to buy or sell.

* The **payoff** of a European call is given by $(S(T)-X)^{+}$, where we use the notation
$$x^{+} = \left\{ \begin{array}{cl} x& \text{if } x>0 \\ 0 & \text{otherwise.} \end{array} \right.$$
For a put option, the payoff is given by $(X-S(T))^{+}$.

* Since the investor will not lose money under any circumstance, a *premium* has to be paid to enter into an option. The prices of the calls and puts will be denoted by $C_E$ and $P_E$ (for European options) and $C_A$, $P_A$ (for American options).

* The gain of an option buyer at time $T$ is given by (for a European call)

$$ (S(T) - X)^{+} - C_{E}e^{rT}$$

## Put-call parity

>**Theorem** For a stock that pays no dividends the following relation holds between the prices of European calls and put options, both with exercise price $X$ and exercise time $T$:
>
>$$ C_E - P_E = S(0) - Xe^{-rT} $$

The above result can easily be shown using the no-arbitrage principle. By making an equivalence with the forward contracts, we can prove the following results:

* If the stock pays a dividend of $d_0$ ($d_0$ is the present value of dividend, i.e., if a dividend is paid at time $t$, then $d_0 = de^{-rt}$) in between $0$ and $T$, then the put-call parity relation is given by

$$ C_E - P_E = S(0) - d_0 - Xe^{-rT} $$

* If the dividends are paid continuously, at a rate $r_d$, then

$$ C_E - P_E = S(0)e^{-r_dT} - Xe^{-rT} .$$

> **Theorem** The prices of Americal put and call options with the same strike price $X$ and expiry time $T$ on a stock that pays no dividends satisfy
>
> $$ S(0) - Xe^{-rT} \ge C_A - P_A \ge S(0) - X $$

* For a stock that pays a dividend $d_0$ (the present value of dividend), then then the prices of American call and put satisfies $S(0) - Xe^{-rT} \ge C_A - P_A \ge S(0) - d_0 - X$.
* For a stock that pays dividends continuously, $S(0)- Xe^{-rT} \ge C_A - P_A \ge S(0)e^{-r_dT} - X$, where $r_d$ is the rate at which dividends are paid. 


## Bounds on option prices

The following inequalities are obvious:

$$ C_E \le C_A, \qquad P_E \le P_A $$

One can also prove the following ones

$$ \begin{align*}
C_E &< S(0) \\
S(0) - Xe^{-rT} &\le C_E \\
P_E &< Xe^{-rT} \\
-S(0)+Xe^{-rT} & \le P_E
\end{align*}$$

For dividend paying stocks, the bounds are

$$ \begin{align*}
\max\{0, S(0) - d_0 - Xe^{-rT}\} &\le C_E \le S(0) - d_0 \\
\max\{0, -S(0)+d_0+Xe^{-rT}\} &\le P_E < Xe^{-rT} \\
\end{align*}$$

### European and American calls on Non-dividend paying stock

*The prices of American and European call options on a stock that pays no dividends are equal*, i.e., $C_A = C_E$, whenever the strike price $X$ and the expiry time $T$ are same for both the options.

### American options

One can easily show the following inequalities for American options that pays no dividends. 

$$ \begin{align}
(S(0)- Xe^{-rT})^{+} &\le C_A \le S(0) \\
(-S(0)+X)^{+} &\le P_A \le X \\
\end{align}$$

#### American options that pays dividends

The prices of American put and call options on a stock that pays no dividends satisfy the inequalities

$$
\begin{align}
\max \{ 0, S(0) - d_0-Xe^{-rT}, S(0)-X \} &\le C_A < S(0)\\
\max \{0, -S(0) + d_0 + Xe^{-rT}, -S(0) + X \} &\le P_A < X \\
\end{align} $$ 

## Variables that determine option prices

Here we shall analyze change of one variable keeping the other variables fixed.

## European options

### Strike price $X$

* The function $C_E(X)$ is a decreasing and $P_E(X)$ is an increasing.
* $C_E(X)$ and $P_E(X)$ are Lipschitz with Lipschitz constant $e^{-rT}$. The following is true provided $X' \le X''$:

	$$\begin{align} C_E(X') - C_E(X'') \le e^{-rT}(X''-X')\\
	  P_E(X') - P_E(X'') \le e^{-rT}(X''-X') \end{align}$$
* $C_E(X)$ and $P_E(X)$ are convex functions on $X$.

### Asset price $S$

Here we consider the asset as a portfolio and make conclusions:

* Functions $C_E(S)$ and $P_E(S)$ are increasing and decreasing, respectively. 
* Suppose that $S' \le S''$, then

$$ \begin{align}
C_E(S'') - C_E(S') &\le S'' - S' \\
P_E(S') - P_E(S') & \le S'' - S'
\end{align}
$$

* Thus $C_E(S)$ and $P_E(S)$ are Lipschitz functions with a Lipschitz constant $1$.
* The functions $C_E(S)$ and $P_E(S)$ are convex functions on $S$.


## American options

The relations of American options are more or less similar to that of European ones.

### Strike price $X$

* $C_A(X)$ and $P_A(X)$ are decreasing and increasing functions respectively. 
* Suppose $X' < X''$. Then

$$\begin{align}
C_A(X') - C_A(X'') \le X'' - X'\\
P_A(X'') - P_A(X') \le X'' - X'
\end{align}$$ 

* Thus the functions $C_A(X)$ and $P_A(X)$ are Lipschitz, with a Lipschitz constant $1$.
* The functions $C_A(X)$ and $P_A(X)$ are convex functions on $X$. 

### Asset price $S$

* $C_A(S)$ and $P_A(S)$ are increasing and decreasing functions respectively.
* Suppose $S' < S''$ then

$$ C_A(S'')- C_A(S') \le S'' - S' \\
P_A(S') - P_A(S) \le S'' - S'$$

* The functions $C_A(S)$ and $P_A(S)$ are Lipschitz with a Lipschitz constant $1$.
* The functions $C_A(S)$ and $P_A(S)$ are convex.

### Dependence on expiry time $T$

* If $T'< T''$, then

$$ \begin{align}
C_A(T') &\le C_A(T''), \\
P_A(T') &\le P_A(T'')
\end{align}$$

## Time value of options

We use the following terminology. We say that at time $t$ a call option with strike price $X$ is

- *in the money* if $S(t)> X$
- *at the money* if $S(t)=X$
- *out of the money* if $S(t)<X$.

Similarly, we say that a put is:

- *in the money* if $S(t)<X$
- *at the money* if $S(t)= X$,
- *out of the money* if $S(t)>X$.

The terms *deep in the money* and *deep out of the money* is used to say that the difference in the level is very high.

**Intrinsic value**: At time $t\le T$, the intrinsic value of a call option with strike price $X$ is equal to $(S(t)-X)^{+}$. The intrinsic value of a put option with the same strike price is $(X-S(t))^{+}$.

**Time value**: The time value of an option is the difference between the price of the option and its intrinsic value.

**Proposition**: For any European or American call or put option with strike price $X$, the time value attains its maximum at $S=X$.


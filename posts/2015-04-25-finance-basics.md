---
layout: post
comments: true
title: Finance Basics 
---

* The rate of return $K_s = \frac{S(1) - S(0)}{S(0)}$. Similarly, the return on an investment commencing at time $s$ and terminating at time $t$ is given by $K(s,t) = \frac{V(t) - V(s)}{V(s)}$. 
* Basic assumptions
  1. The future stock price $S(1)$ is a random variable with at least two different values.
  2. The future stock price of a risk-free security is a known number.
  3. The prices of a stock price will always be positive.
  4. The investor may hold any number $x$ and $y$ of stock shares and bonds, whether integer of fractional, negative, positive or zero.
  5. The wealth of the investor should be non-negative at all time.
  6. The future price $S(1)$ of a stock is a random variable that taking only finitely many values.
  7. No-Arbitrage principle: The payoff for a non-risky asset cannot be always positive. In other words, there "free-lunches" does not exist.

## Risk-free assets

* In case of *simple interest rate*, the interest rate is equal to the return over one year, i.e., $K(0,1) = r$.
* In case of periodic compounding, $V(t) = \left(1 + \frac{r}{m}\right)^{tm}P$.
  * The future value of $V(t)$ increases, if any one of the parameters $m$, $r$, $t$ or $P$ increases, while the others are kept unchanged.
  * $V(0) = V(t)\left(1 + \frac{r}{m}\right)^{-tm}$.
  * The factor in the right by which $V(t)$ is multiplied is known as the discount factor.
* *Annuity* is a sequence of finitely many payments of a fixed amount due at equal time intervals.
  * Suppose the fixed amount of payments be $C$ and the term be $n$ years, the interest rate for annual compounding be $r$, then $PA(r,n) = \frac{1}{1+r} + \cdots + \frac{1}{(1+r)^n}$.
* The continuous compounding is a case in which $V(t) = V(0)e^{rt}$.
* The logarithmic return is defined by $k(s,t) = \ln \frac{V(t)}{V(s)}$.
  * The logarithmic return is additive.

## Money market

* A *bond* is a financial security promising the holder a sequence of guaranteed future payments. Bonds are risk-free, meaning that the payments are guaranteed.
* **Zero coupon bonds**: This involves a single payment, a payment of amount $F$, called the *face value*, at time $T$.
  * The present value of the bond with corresponding annual compounding rate $r$ is givey by $V(0) = F(1+r)^{-1}$.
  * The price of a bond at time $t$ is denoted by $B(t,T)$. Thus, the price of the bond at $0$ is given by $B(0, T)$.
	* For periodic compounding with frequency $m$, $B(t, T) = \left( 1+ \frac{r}{m}\right)^{-m(T-t)}$.
	* For continuous compounding $B(t, T) = \exp{(-r(T-t))}$.

* **Coupon bonds**: Bonds promising a sequence of payments are called *coupon bonds*. These payments consist of the face value due at maturity, and coupons paid regularly, typically annually, semi-annually, or quarterly, the last coupon due at maturity.
  * The coupon can be expressed as a fraction of the face value. *Assuming that the coupons are paid annually*, we shall write $C = iF$, where $i$ is the coupon rate.
  * Whenever coupons are paid annually, the coupon rate is equal to the interest rate for the annual compounding if and only if the price of the bond id equal to its face value. In this case we say that the bond sells *at par*.


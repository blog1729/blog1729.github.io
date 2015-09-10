---
layout: post
comments: true
title: Exotic options
---

* Derivatives such as European and American call and put options are what are termed as *plain vanilla products*, they have standard well-defined properties and trade actively.
* There are a number of non-standard options created by a financial engineer. These products are termed as *exotic options*, or simply *exotics*.

* **Non standard American options**: In a standard American option, exercise can take place at any time during the life of the option and the exercise price is always the same, but there are similar options with some variations, such as:
  * **Bermuda option**. Early exercise may be restricted to certain dates.
  * Early exercise may be allowed during only part of life of the option, for example, there may be an initial "lock out" period with no early exercise.
  * The strike price may change during the life of the option.

* **Chooser option** (sometimes referred to as *as you like it* option) has a feature that, after a specified period of time, the holder can choose whether the option is a call or a put. Suppose the time when the choice is made is $T_1$, the value of the option at the time is $\max (c,p)$.

## Barrier options

* **Barrier options** are options where the payoff depends on whether the underlying asset's price reaches a certain level during a certain period of time.
* There are two different type of barrier options:
  1. **Knock-out option**: ceases to exist when the price of underlying reaches a certain barrier.
  2. **Knock-in option**: comes into existence when the price of underlying asset reaches a certain barrier.

* A **down-and-out** call is one type of knock-out option. It is a regular call option that ceases to exist if the asset price reaches a certain barrier level $H$. The barrier level is below the initial asset price. The corresponding knock-in option is called **down-and-in** call.
* A **up-and-out** call is a regular call option that ceases to exist if the asset price reaches a barrier level, $H$, that is higher than the current asset price. An **up-and-in** call is a regular call option that comes into existence only if a barrier is reached.

## Binary option

* **Binary options** are options with discontinuous payoffs. An example of a binary option is a **cash-or-nothing** call. This pays off nothing if the asset price ends up below the strike price at time $T$ and pays a fixed amount, $Q$, if it ends up above the strike price. A **cash-or-nothing put** is defined analogously to a cash-or-nothing call. 
* **Asset-or-nothing call** pays off nothing if the underlying asset price ends up below the strike price and pays the asset price if it ends up above the strike price. Similarly, an **asset-or-nothing** put pays off nothing if the underlying asset price ends up above the strike price and the asset price if it ends up below the strike price.
* A regular European call option is equivalent to a long position in an asset-or-nothing call and a short position in a cash-or-nothing call, where the cash payoff of the cash-or-nothing call equals the strike price. 

## Lookback options

* The payoffs from a **lookback** option depend on the maximum or minimum asset price reached during the life of the option. The payoff from a **floating lookback call** is the amount that the final asset price exceeds the minimum asset price achieved during the life of the option. The payoff from a **floating lookback put** is the amount by which the maximum asset price achieved during the life of the option exceeds the final asset price.

## Shout options

* A **shout option** is a European option where the holder can "shout" to the writer at one time during its life. At the end of the life of the option, the option holder receives either the usual payoff from a European option or the intrinsic value at the time of shout, whichever is greater.
* A shout option has some of the same features as a lookback option, but it is considered less expensive.
* If the holder shouts at time $\tau$ when the asset price is $S\_\tau$, the payoff from the option is $ \max (0, S\_T - S\_{\tau}) + (S\_\tau - K)$.

## Exotic options

* Asian options are options where the payoff depends on the average price of the underlying asset during at least some part of the life of the option.
* The payoff from an **average price call** is $\max (0, S\_{ave} - K)$ and that of an **average price put** is $\max(0, K - S\_{ave})$, where $S\_{ave}$ is the average value of the underlying asset calculated over a predetermined averaging period.
* The book, Options, Futures and other derivatives, mentions that the average options are less expensive than regular options.
* Another Asian option is an **average strike option** which pays off $\max(0, S_T - S\_{ave})$ and an **average strike put** pays off $\max(0, S\_{ave} - S\_{T})$. 

**References**: Chapter 24, Exotic options. Options, Futures and other derivatives, 7th ed; John C. Hull.

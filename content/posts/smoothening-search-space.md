---
title: "Smoothing Search Space"
date: 2025-05-18T22:27:52+09:00
draft: true
---

Many interesting problems in Computer Science are search problems.
The holy grail of Computer Science (program synthesis problem!) is also a search problem.
Unfortunately, many of those search problems are inherently intractable.
For example, finding the most efficient expression in an e-graph is NP-hard.

The inherent difficulty of the search problems is due to the nature of combinatorial search.
The number of possibilities that we have to consider grows super fast.
For example, with a very simple grammar $S \rightarrow x ~|~ S + S$,
the number of possible programs is 3791862310265926082868235028027893277370233152247388584761734150717768254410341175325352026
after 10 expansions of top-down synthesis (see this [slides](https://github.com/prosyslab-classroom/cs424-program-reasoning/blob/main/slides/lecture9.pdf)).
In addition, there is no good way to gravitate the search process to the global optimum.
In the example of program synthesis, we have to enumerate all possible cases with some hueristics to filter out unnecessary cases (e.g., $x + (x + x) = (x + x) = x$)

One good alternative approach to the combinatoric search is to smooth the search space to a differentiable one from the discribe space.
The (combinatoric) search problem could be described as finding the input that minimizes the cost function,
where the input is discrete (thus enumerable through nutural numbers).
For this problem, there is no better way than brute-forcing all possible inputs in general.

$$
\text{min}(f(n)) ~\text{where}~ f : \mathbb{N} \rightarrow \mathbb{R}
$$

If we somehow manage to come up with a smooth function $g$ that replaces $f$,
we can take the derivative of the function to make use of the gradient-descent algorithm.

$$
\text{min}(g(n)) ~\text{where}~ g : \mathbb{R} \rightarrow \mathbb{R}
$$

## Case Study: SmoothE

* https://dl.acm.org/doi/10.1145/3669940.3707262
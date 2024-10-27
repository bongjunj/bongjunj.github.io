---
title: "Calculus of Computation"
date: 2024-10-27T16:50:20+09:00
---

My summary of the book "Calculus of Computation" by Aaron R. Bradley and Zohar Manna.

## Ch5. Program Correctness: Mechanics

- Partial correctness guarantees the function obeys its specification when it terminates.
- Total correctness then ensures that the function terminates on top of partial correctness.

### Proof of partial correctness

Useful formulae will appear in the followings:

1. Function Specification (Precondition, Postcondition)
2. Loop Invariant (Invariants that hold at the beggining of each iteration, before condition check)

Note that recursive functions' preconditions and postconditions will do the same job as loop invariants.

One can construct basic paths from the function in a Hoare triple form as below:

$$
\lbrace P \rbrace ~S~ \lbrace Q \rbrace
$$

where $P$ and $Q$ are first-order logical formulae and $S$ is a statement.
From the triple, one can derive the following formula:

$$
P \rightarrow wp(Q, S)
$$

where $wp(Q, S)$ is the weakest precondition of $Q$ given $S$.

The weakest precondition can be computed as below:

1. $wp(Q, \texttt{assume}~p) \Leftrightarrow p \rightarrow Q$ (for branches)
2. $wp(Q, \texttt{x := E}) \Leftrightarrow Q\\{x \mapsto E\\}$ (substitution)
3. $wp(Q, S_1; S_2) \Leftrightarrow wp(wp(Q, S_2), S_1)$ (replay from back)

### Proof of total correctness

If the function is shown to be partially correct, it only suffices to show its total correctness. Usually one can prove the termination with a ranking function.

A ranking function maps a state of the program to mathematical objects of a well-founded relation $\prec$. Any sequence decreasing according to $\prec$ eventually reaches the base case in a finite number of steps, and there is no infinite descending sequence.

For example, let $\prec$ be a relation over pairs of natural numbers
such that $(n_1, n_2) <_2 (m_1, m_2)$ holds if $n_1 < m_1$ or $n_2 < m_2$. Since a natural number is well-founded and at least one of the pair always decreases, we know that the relation is also well-founded.

---
title: "동적 타입은 존재하지 않는다"
date: 2025-08-24T13:03:23+09:00
---

The English version appears below the Korean one.

---

최근 파이썬을 위한 타입 검사기들이 속속 등장하고 있다.
파이썬이 점차 대규모 프로그램 개발에 사용되면서, 미처 포착하지 못하는 프로그램 오류들을
사전에 방지하기 위한 기술이 필요해지고 있기 때문이다.
타입 검사기는 그 중에서도 실행 중 타입 오류를 예방하는 일을 한다.
대표적인 파이썬 타입 검사기인 [PyRight](https://github.com/microsoft/pyright/blob/main/README.md)의 설명을 읽어보면
파이썬을 위한 **정적** 타입 검사기 (static type checker)라고 소개하고 있다.

하지만 **동적** 타입 언어의 **정적** 타입 검사기는 도대체 무슨 뜻일까?
곰곰히 생각해보면 동적 타입 언어는 그 뜻부터 모호하다.
타입 검사(Type Checking)란 프로그램 실행 전에 프로그램에 타입 오류가 없음을 증명하는 과정이다.
정적 타입 언어에서는 프로그램에 적힌 타입에 프로그램이 속하는지 확인함으로써 이를 증명한다.
타입 추론(Type Inference)을 통해 프로그램이 타입이 적혀져 있지 않더라도
타입을 자동으로 알아낼 수도 있다.
이 과정에서도 프로그램이 정해진 타입에 속하는지 확인하는 과정은 달라지지 않는다.

하지만 동적 타입 검사란 단지 더 이상 계산할 방법이 없어 계산이 멈추는 untyped λ-calculus의 연산 실패에 불과하다.
동적 타입 언어는 값에 "타입"이라는 또 다른 값을 덧붙인다.
예를 들어, `1 + "hello"` 프로그램을 계산할 때, `1`을 `(1, int)`로, `"hello"`는 `("hello", str)`로 계산한다.
여기서 `+`을 계산하려면 `int`와 `str` 사이에 정의된 덧셈 연산이 있어야 하는데, 그런 연산은 없다. (Python이라고 생각해보자.)
따라서 더 이상 연산이 정의되지 않은 상태에 도달해 프로그램이 멈춘다. (Python은 `TypeError`를 내뱉는다.)
이 과정을 다시 살펴보면, untyped λ-calculus의 연산 실패와 정확히 같으며 전혀 새로울 것이 없다.

그러므로 파이썬 정적 타입 검사기가 하고자 하는 것은 untyped λ-calculus 언어에서 실행 중에 연산 실패가 없음을 유한 시간 안에, 자동으로 증명하는 것이다.
"유한 시간 안에", "자동으로" 값을 검사해 어떤 오류가 없게 한다고? 요약 해석을 통한 정적 분석기가 필요하다.
요약 해석의 도메인을 살펴보기 위해 동적 타입 언어가 다루는 값을 수학적으로 표현해보자.
동적 언어가 다루는 값 $\mathbb{V'}$은 값 $\mathbb{V}$에 타입 정보 $\mathbb{T}$를 덧댄 것에 불과하다.

$$
\mathbb{V'} = \mathbb{V} \times \mathbb{T}
$$

$$
\mathbb{T} = \{~\text{int},~\text{float},~\text{str}~\}
$$

따라서 정적 분석기는 $\mathbb{V'}$의 요약 도메인을 이용하며, 여기서 서로 타입이 맞지 않는 값끼리 일어나는 연산을 탐지한다.
오탐(False Alarm) 같은 요약 해석의 현상이 파이썬 정적 타입 검사기에 나타나는 것은 이 때문이다.
(많은 파이썬 정적 타입 검사기들이 오탐을 줄이고자 `Any` 타입과 일어나는 연산에 대한 알람을 무시하는데, 이 때문에 정적 타입 검사를 해도 타입 오류가 사라지지 않는 것이다.)
결국 동적 타입 언어를 정적으로 타입 검사한다는 것은 $\texttt{값} \times \texttt{타입}$ 도메인에 대한 요약 해석인 것이다.

이쯤되면 동적 타입 언어의 "타입"이란 이론적으로 정립된 "타입" 이론의 그것과 전혀 다른 개념임을 알 수 있다. 전혀 다른 개념을 같은 "타입"으로 부르고 있으니 혼란이 가중되는 것은 당연하다.
서로 하는 일에 완전히 다른 데도 불구하고 같은 "타입 검사"라고 묶어버리니 논의가 불분명해질 수 밖에 없다.
"동적 타입"이라 부르지 말고 더 정확한 용어를 찾아보자. 적당한 용어로 "태그"라고 부르는 것은 어떨까?

---

Update: 2025-08-25

이 글에서 제안한 요약해석기는 흐름을 따져야한다(Flow-Sensitive Analysis).
다음같은 예시를 생각해보자.

```python

1: x: None = None
2: if ...:
3:     x = 5
4: else:
5:     x = "hello"

6: print(x)
```

PyRight 타입 검사기는 `x`에 `5`나 `"hello"`를 대입할 수 없다고 보고한다.
그런데 사실 이는 실행가능한 파이썬 프로그램이다.

흐름을 무시하는 요약해석은 이런 허위보고를 일으킨다.
Line 1에서 정의된 `x`가 Line 3, 5에서도 같은 태그(타입 정보)를 가진다고 판단하기 때문이다.
흐름을 따지는 요약해석기는 이런 허위보고를 하지 않는다.
Line 1을 `x = None`로 고치면 PyRight의 허위보고가 사라진다.
PyRight은 흐름을 따지거나, 흐름을 따지지 않는 그 어딘가에 있는 것 같다.

---

A recent wave of type checkers for Python has emerged. As Python is increasingly used for large-scale program development, a need has arisen for techniques to prevent program errors that might otherwise go unnoticed. Type checkers, in particular, aim to prevent type errors during runtime.

A prime example is [PyRight](https://github.com/microsoft/pyright/blob/main/README.md), a representative Python type checker whose description introduces it as a static type checker for Python.

But what does a static type checker for a dynamically typed language even mean? When you think about it, the term "dynamically typed language" is inherently ambiguous. Type checking is the process of proving that a program is free of type errors before it runs. In statically typed languages, this is proven by checking that the program conforms to the types written within it. Through type inference, a program's types can be automatically determined even if they aren't explicitly written. This process still involves verifying that the program belongs to a predetermined type.

However, dynamic type checking is merely the failure of an operation in the untyped λ-calculus, where the calculation stops because there's no way to proceed. Dynamically typed languages attach another value, a "type," to their values. For example, when evaluating the program `1 + "hello"`, 1 is evaluated as `(1, int)` and "hello" as `("hello", str)`. To evaluate the `+` operator, there must be a defined addition operation between int and str, but no such operation exists (think about Python). The program therefore reaches a state where no further operations are defined and stops (Python raises a `TypeError`). When we look closely at this process, it's exactly the same as an operational failure in the untyped λ-calculus, with nothing new about it.

Thus, what a Python static type checker aims to do is to automatically prove, within a finite amount of time, that there will be no operational failures at runtime in an untyped λ-calculus language. To automatically check values for a lack of errors "within a finite amount of time," an abstract interpretation-based static analyzer is needed. To examine the domain of abstract interpretation, let's mathematically represent the values handled by a dynamically typed language. The values $\mathbb{V'}$
handled by a dynamic language are simply values $\mathbb{V}$ tagged with type information $\mathbb{T}$.

$$
\mathbb{V'} = \mathbb{V} \times \mathbb{T}
$$

$$
\mathbb{T} = \{ \texttt{int}, \texttt{float}, \texttt{str} \}
$$

Therefore, a static analyzer uses an abstract domain of $\mathbb{V'}$
and detects operations that occur between mismatched-type values. This is why abstract interpretation phenomena like false positives appear in Python static type checkers. (Many Python static type checkers ignore warnings for operations involving the `Any` type to reduce false positives, which is why type errors can still occur even after static type checking.) In the end, statically type-checking a dynamically typed language is an abstract interpretation over the $\texttt{value} \times \texttt{type}$ domain.

At this point, it's clear that the "type" in a dynamically typed language is a completely different concept from the "type" in a theoretically established type theory. It's natural for confusion to arise when entirely different concepts are called the same thing, "type." Since they do completely different things but are grouped under the same term "type checking," discussions can't help but become unclear. Instead of calling it "dynamic typing," let's find a more accurate term. How about "tagging"?

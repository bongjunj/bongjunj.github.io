---
title: "The Next Revolution"
date: 2025-05-16
---

<!-- Throughout human history, there were many consequential revolutions.
For example, the April Revolution in Korea, the French Revolution, Bolshevik Revolution
and the American Revolution dramatically changed the political structure of those countries.
In addition, during 1960s in Western World, the sexual liberation movement
was a transformative cultural shift that redefined norms around sex, gender, and personal freedom.
Lastly, the Agricultural Revolution, the Industrial Revolution and the Information Revolution
also transformed the human society by introducing a new mean of production. -->

## Early Revolutions

A revolution is an event that changes the human society fundamentally and structurally.
It can impact the political, social and economical aspects of the society.
Through the histry, there were many consequential revolutions, including the French Revolution, the American Revolution.
But I want to focus more on the three transformative revolutions that were discussed in the book
_The Third Wave_, by Alvin Toffler.

The key point of the three revolutions is that each of them introdued a new mean of production. Let us discuss in detail for each cases.

The Agricultural Revolution introduced cultivation.
It secured the food resources such as crops and cattles.
Before the revolution, a society often relied on the food resource from hunting, fishing and wild crops.
Hence, the size of a society was limited. However, after the revolution, the scale of a society began to grow,
leading to the beginning of civilization.
It also introduced the concept of land ownership and the economy based on it.

The Industrial Revolution brought the concept of mass production.
It started mechanization and automation to the production,
and enabled material abundance.
For example, in another book [_Factfulness_](https://www.amazon.com/Factfulness-Reasons-World-Things-Better/dp/1250107814),
the author pointed out that the percentage of people suffering from extreme poverty
has been ever decreasing.
To be more specific,  the percentage in 2024 is 8.5% wherease the one in 1990 is 37.9%. Check the [data](https://ourworldindata.org/poverty?insight=global-extreme-poverty-declined-substantially-over-the-last-generation#key-insights).
<!-- In addition, it led to urbanization and governmental reforms to support the rising demand of labor force to the industries. -->

Lastly, 
Most importantly, the information itself began to create value and brought wealth to people.
For example, Google became one of the largest company in the world by efficiently aggregating informations in the Internet.
Also, the development of Black-Sholes equation provided a mathematical foundation for derivative pricing,
and catalyzed the rise of quantative trading firms.
(I recommned you to see the video of the Black-Scholes equation: https://www.youtube.com/watch?v=A5w-dEgIU1M)

## Information Revolution

Next, there is the Information Revolution.
the Information Revolution fundamentally changed the speed and the scale of
the way the informations are processed and exchanged.
We now can communicate with people in the opposite side of the globe almost instantly.

The most interesting point of the Information Revolution is an information which has no physical form
started to create value.
Cultivation and farming produced crops and livestocks which are physical objects.
Similarly, factories built upon mechanization and automation manufactured physical goods.
However, the information technology only generates another information from an information,
but still can generate value.

For example, Google became one of the largest company in the world by developing its search engine.
The job of a search engine is simple: it aggregates information on the Internet
and finds the most appropriate one to a query.
There is no production or exchange of physical object.
However, Google made $198.1B in 2024 from the search,
demonstrating the fact that the information service generates value.

The development of the Black-Scholes equation also illustrates the interesting aspects of the Information Revolution.
The equation provided a mathematical foundation of derivative pricing and catalyzed the rise of quantative trading firms.
There is no doubt that information generates value since such firms as whole make trillions of dollars.

## AlphaFold Revolution

{{<youtube id="P_fHJIYENdI" title="The Most Useful Thing AI Has Ever Done">}}

I recently ran across this YouTube video and was shocked by its implication: AI is **really** going to change the world for good!
Shortly after, I came up with an idea that AI is introducing a new mean of production
just like the three revolutions did as I discussed above.
It could sound like any other AI enthusiast.
However, connecting the recent developments of AI urged me to leave an essay like this.
Let us dive into more details.

First of all, AlphaFold discovered over 200 million proteins. This is a shocking result
because, before AlphaFold, human researchers have only discovered 170,000 proteins (less than a million!).
The difference in scale is staggering.
It is important here to understand that the protein discovery problem is known to be extremely complex.
The problem is to find a plausible folding structure in 3D from a 2D amino-acid structure.
However, the number of possible structures is astronomically large.
For example, a simple protein consists of 35 amino-acid can be folded in $10^{33}$ ways.
Therefore the problem cannot be solved by simply enumerating all possible structures.

However, AlphaFold solved this problem by encoding the biological insights into AI and letting the system to predict promising structured.
For example, they encoded the changes of proteins through evolutions into the AI.
This is because when an evolution mutates the amino-acid sequence of a protein,
it does not change a single amino-acid, but also impact other proteins to remain physically stable.
This helps the AI learn closely located amino-acids in the protein.

<!-- The second innovation is restricting the actions that can be taken by the AI.
The [structure module](https://youtu.be/P_fHJIYENdI?t=1035&si=I_UyfAL0CRok9mi7) predicts the protein structure only through translating and rotating amino acids.
This enables AlphaFold predicts only structurally possible structure (because that's what "folding" is all about.)
The researchers also found that, even though it still can predict a physically weird protien,
the system naturally learns to reject such protein structures. -->

After all, AlphaFold solved one of the most complex problem.
The impact of AlphaFold is consequential not only because the problem is extremely difficult
but also it solves the problem at a unprecedented scale (200 millions vs. 170,000).
I realized that if this can be applied to other fields of Mathematics and Science,
we are going to discover new interesting facts in a massive and unprecedented scale.
Imagine that we can generate new mathematical theorems and scientific facts everyday or every-minute.
Surprisingly, the innovations towards this are already happening.

## AI for Mathematical and Scientific Discoveries

{{<youtube id="IHc0TEMrEdY">}}

This lecture discusses the recent progress of application of LLM to mathematics and science.
The recent LLMs such as OpenAI [o3](https://openai.com/index/introducing-o3-and-o4-mini/) are reinforced for mathematical reasoning and coding tasks.
And researchers are exploring methods to use the encoded knowledge
to write a mathematical proof and to derive a mathematical representation from scientific data.

<!-- (see [1:02:43](https://www.youtube.com/live/IHc0TEMrEdY?si=XE6__X-HPZYKklqV&t=3763)). -->


{{<youtube id="cyyR7j2ChCI">}}

One of the greatest mathematicans alive, Terence Tao, is also working to bringing LLM to mathematics.
In the video, he is formalizing proofs using an AI coding assistant, with Lean proof assistant.
A proof assistant is a system that automatically verifies a mathematical proof using a set of tactics.
Generally, a tactic transforms the proof goal into another by using mathematical definitions, theorems, case analysis, induction hypothesis and more.
For example, you _code_ a proof of $m + n = n + m$ for natural numbers, using a sequence of tactics that consists of induction and reflexivity.
If the proof assistant accepts the proof, you can believe the proof is correct.

However, the biggest drawback of proof assistant is that we cannot automate the process of writing a proof.
We need human experts (usually with PhD-level knowledge) for the tasks.
But what if we can teach the AI the know-how of writing a proof in such systems?
We already have the proof assistant system whose user can use only defined tactics.
The high-level framework for this innovation seems identical.
I predict, in the future, we are going to see a new mathematical proof written by a machine not a human.


In addition, Google recently announced [AlphaEvolve](https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/) that discovers new algorithms automatically.
It used the evolution algorithm that tracks the promising algorithms in its pool, with automated evaluation system.
Applied to discover a faster matrix multiplication, it discovered a faster algorithm for 4x4 matrix multiplication, which has been extensively researched but not solved for decades. 


## Conclusion: Knowledge Revolution

This is an exciting moment: a new era is opening up.
I want to remark this period of time as the Knowledge Revolution.
With AI, we are going to live an era where a new knowledge is generated almost effortlessly.

This is particularly interesting because scale always create paradigm shifts.
For example, think of how the introduction of railway systems during the Industrial Revolution enabled people to travel further and faster.
People then could travel multiple cities and be in different time zones.
It demanded them to synchronize times across multiple cities.
Interestingly, the time synchronization problem raised the profound question: "what is time?"
The question eventually led to the discovery of Einstein's theory of relativity.

The revolution is already happening.
We are discovering millions of new proteins automatically.
We are discoving new faster algorithms using AI.
I am sure that there will be another new surprising news shortly.
We will be flooded with new high-quality knowledge!

<!-- In the same way as AlphaFold did to Biology, AI is going to generate scientific facts.
Imagine the world with AI that can bring us new scientific insights in an automated fashion.
We have never lived such era.

New mathematical theorems, new physical patterns and new machinery will be generated for us everyday.
The Agricultural Revolution introduced a new means of production: the cultivation of land through farming.
The Industrial Revolution also brought machanized mass production, replacing manual labor.
The Information Revolution enabled value creating through information processing, not from physical goods.
And now, the next revolution is going to introduce a new means of production: the automated generation of knowledge. -->


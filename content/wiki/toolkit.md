---
title: "Toolkit"
date: 2025-10-18
---


## GNU Parallel

GNU `parallel` is one of the greatest tool for PL/SWE research.
At the end of the day, you as a researcher have to evaluate the system you developed.
For example, you might want to answer a research question like "how effective is XXX in synthesizing ...?"
To answer the question, a benchmark that consists of tons of inputs is constructed, and the system is tested against them.
In this scenario, it is always better to parallelize the executions because time is gold.

However, it is very annoying to write the evaluation script with parallelization.
For example, in Python, you have to learn how to use the pool executor API: `submit`, `join`, `as_completed`, and so on.
The process management is also a nightmare, and you might end up with tons of zombie processes if it goes wrong.
Even more, when you want to visualize the progress, `tqdm` easily breaks with the executor API.
You have to go through a lot of trials and errors to get the script right.

Here, `parallel` comes to the rescue.
All you need is write a command for each input.
For example, what you want is just a single line:
```bash
find inputs/*.ll | parallel --bar --joblog job.log --timeout 3600 -j (nproc) "<system> {} > outputs/{/}.result 2> outputs{/}.error"
```

The `--bar` option gives a nice progress bar. The log file contains how long it took for each command to finish.
In addition, it is very straightforward to specify the timeout for each command and the number of job workers.


---
title: "Toolkit"
date: 2025-10-18
---


## GNU Parallel

GNU `parallel` is one of the greatest tool for PL/SWE research.
Every now and then, we have to evaluate the system you developed. (Measuring almost always intrigues us!)
For example, at least for writing a paper, you might have to measure for a research question like "how effective is XXX in synthesizing ...?"
To answer the question, a benchmark that consists of tons of inputs is often constructed, and the system is tested against them.
In this scenario, it is always better to parallelize the executions because faster iteration means faster improvement!

However, it is very annoying to write such a script especially with parallelization.
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

## sqlite3

It is almost always better than having scattered CSV or JSON.
You don't need `pandas`. You do not need `jq`. Just good old SQL queries to get your job done.
Even more, I find working with coding agents when data are in a sqlite3 db more pleasant than when they are scattered through files.
They excel at writing SQL queries since GPT-3.5 (and we now have GPT-5.5).
In addition, you can save those analysis queries in a text file and run it via: `sqlite3 your_db.db < analysis.sql`.
Moreover, your favorite programming language will provide a binding for sqlite3. (Python, OCaml, Rust, and you name it!)
So, it is straightforward to integrate data collection into your pipeline.


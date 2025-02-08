---
title: "Just Use Argparse"
date: 2025-02-08T18:08:01+09:00
---

Writing Python scripts is probably one of the most useful skills as a software engineer.
As a project grows, we find ourselves dumping loads of scripts everywhere,
making it hard to resist the urge to manage them somehow.
One way to manage scripts better is by turning them into CLI applications.
By letting them take arguments rather than hard-coding the configuration values in the scripts such as filepaths,
we can re-use them anytime we need some jobs done.

For the sake of this, Python provides you a built-in which is `argparse`.
It lets us parse command-line arguments so that we can easily convert the scripts for project-specific applications.
While `argparse` is built-in, other libraries like `click` aim to simplify the process.
And they are obviously easy to use.
For example, to write a simple greetings application, `click` provides a lot simpler way as below:

```python
parser = argparse.ArgumentParser()
parser.add_argument('name', type=str, help="what's your name?")
args = parser.parse_args()

def hello(name):
    print(name)

hello(args.name)
```

```python
@click.command()
@click.argument('name')
def hello(name):
    click.echo(f"Hello {name}!")
```

With `click`, the command hello remains a self-contained function with clear decorators, whereas in `argparse`, you have to manage the argument parser separately.
Hhow beautiful it is to keep a command `hello` as a python function with self-explanatory decorators!
It is quite easy to think that managing command lines is way easier with `click` than with `argparse`.
However, from my experience for the past year, it seems that the opposite is true for several reasons.

First, the most painful drawback of `click` is that it uses decorators heavily.
A decorator turns a python function into somewhat else.
In turn, you can't call the function directly. If you need call them, you end up using the API `ctx.invoke(hello, ...args)`.
I found it annoying when I want just a simple python script to get a job done.
Even for one-off scripts, you might be forced to use `@click.pass_context`, adding extra complexity.
As a result, you need to one more argument (`ctx`) in the function.
In addition, a decorator breaks the editor support.
I use VSCode, and its type analysis does not work for decorator-wrapped functions.
It makes me go back and forth to see which arguments the function needs.

Second, it adds an extra dependency to the project.
I get that, even with the drawbacks I described earlier, using `click` can help developing projects.
However, at the point you want to publish your work, you need to consider dependencies.
For this, no other options can beat `argparse`! Because `argparse` is built-in, users don’t need to install anything.
Using `click` means potential setup issues—leading to unexpected GitHub issues or extra emails to your inbox.

Furthurmore, here are some ways to manage Python scripts with `argparse` more efficiently in a project:

- `lib`: utility modules
- `tool`: you implement `argparse`-applications using modules in `lib`
- `scripts`: you manage your one-off scripts here. bash, python whatever.

This way, you can manage CLI applications just like using `@click.group()`:

```bash
tool/command.py [args] # instead of ./tool.py command [args]
```

And your python utils are just python functions which do not need an extra `ctx` object
and they come with decent editor supports!

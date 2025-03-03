---
title: "pyinfra lets you go to bed"
date: 2025-03-03T12:33:45+09:00
---

This is a story how `pyinfra` let me go to bed.

Working as a TA, I was tasked to set up 170 virtual machines for students' development environment (My professor runs a huge course.)
As the dominance of x86 is fading away, students started to have more diverse pool of machines.
They have (classic) x86, aarch64 with an amazing variety of OS (windows, macos, ubuntu, and arch?).
So it is better to set a "standard" to avoid unnecessary headaches due to environment mismatch.
(Worst scenario: "it works on my machine")
Also, it is convenient that we can just `ssh` to their machine and see how we can help them, just in case.

Anyway, the requirements were:

- Install system packages: `cmake`, `curl`, ...
- Create student's account in the system
- Install LLVM, OCaml dev environment and other interesting softwares, ...

It seemed straightforward at the beginning.
I thought just using the bash scripts which have been used for generations (by previous TAs) would get the job done.
But, it quickly turned out to be dead false.
I couldn't even get to the very first requirement!
I investigated what was going on and figured out that
`apt update && apt install ...` _was NOT working_ for some machines and _WAS working_ for some machines (WHAT?)

### Fighting network failures

It turned out that the problem was network failures.
Some machines couldn't get connection to the apt repository due to rate-limiting.
**The virtual machines was behind same NAT,** which would make the apt repository see them as a single machine with different ports.
I was commiting **DDOS** attack to the repository with 170 machines!

Not to bother the repository again, I really needed more than just bash scripts,
which just unleash all the machines to race to the repository simultaneously.
I wanted to set a limit for the parallelism, skip if installation was done already, and retry until the setup is completed for all the machines.
Doing all these by adding new features to the bash scripts would take several days and nights.
Luckily, I found `pyinfra`, which have all the features I wanted.

Setting a parallelism limit and skipping were just a piece of cake.
To get the job done, you define an operation just like below:

```python
# system-setup.py

apt.packages(
    name="Ensure essential system packages are installed",
    packages=SYSTEM_PACKAGES, # ["make", "git", "cmake", "curl", ...]
    update=True,
    cache_time=60 * 60 * 24, # update every 24 hours
    _parallel=4, # Try not to DDOS the apt repository
)
```

It runs `apt update` once a day and the command is run on only up to 4 machines.
And it runs `apt install <SYSTEM_PACKAGES>` or skips the command if the installations are already there.
But still, some machines can fail. (They can fail for any reason. LISTEN to me. They will.)

So need to have them retry until they finish their work. For that, you do:

```bash
until pyinfra machines.py system-setup.py -y; do
    echo "retry...";
    sleep 30; # take a rest for a while (for what I don't know)
end
```

### The ugly duckling

There was the ugly duckling machine.
The machine was notoriously slow at building some packages.
While other machines finished building them within just 10-ish minutes,
the machine was stuck over an hour.
Solution? Just simply set a timeout just like this:

```python
server.shell(
    name="install ocaml packages",
    commands=[
        f'opam install -y utop dune llvm ...',
    ],
    _timeout=60 * 60, # an hour
    _env={'OPAMYES': '1', 'OPAMSWITCH': OPAM_SWITCH},
)
```

The timeout will let you know which machines are ugly ducklings.
Sadly, you need to replace that machine.
At the end of the day, it's just a virtual machine whose CPU cores are not doing their job...

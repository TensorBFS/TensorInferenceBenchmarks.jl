# Benchmark Report for *TensorInferenceBenchmarks*

## Job Properties
* Time of benchmark: 3 Jul 2023 - 16:17
* Package commit: dirty
* Julia commit: 17cfb8
* Julia command flags: None
* Environment variables: `JULIA_NUM_THREADS => 1`

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                   | time            | GC time | memory          | allocations |
|----------------------|----------------:|--------:|----------------:|------------:|
| `["map", "map"]`     |  67.890 ms (5%) |         |  50.88 MiB (1%) |      158396 |
| `["mar", "mar"]`     |  42.908 ms (5%) |         |  35.58 MiB (1%) |      182350 |
| `["mmap", "mmap-1"]` |  10.467 ms (5%) |         |  10.34 MiB (1%) |       46541 |
| `["mmap", "mmap-2"]` |  76.454 ms (5%) |         | 160.58 MiB (1%) |       49364 |
| `["mmap", "mmap-3"]` | 275.358 ms (5%) |         | 189.82 MiB (1%) |      156672 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["map"]`
- `["mar"]`
- `["mmap"]`

## Julia versioninfo
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      "Arch Linux"
  uname: Linux 6.3.7-arch1-1 #1 SMP PREEMPT_DYNAMIC Sat, 10 Jun 2023 00:35:35 +0000 x86_64 unknown
  CPU: Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  3299 MHz     113267 s        128 s      30927 s    4485748 s       4831 s
       #2  2990 MHz     118145 s        722 s      32515 s    4473055 s      12166 s
       #3  3300 MHz     118319 s        325 s      32855 s    4484704 s       3872 s
       #4  2000 MHz     114977 s        334 s      32802 s    4485111 s       5155 s
       #5  2000 MHz     110475 s        184 s      35226 s    4471060 s       8094 s
       #6  2000 MHz     115614 s        667 s      31448 s    4486698 s       4500 s
       #7  3024 MHz     101236 s        201 s      31776 s    4498281 s       7296 s
       #8  3300 MHz     112567 s        665 s      32018 s    4490965 s       3858 s
  Memory: 15.326461791992188 GB (3593.06640625 MB free)
  Uptime: 465122.25 sec
  Load Avg:  1.8  1.13  0.99
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake)
  Threads: 1 on 8 virtual cores
```
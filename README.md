# TensorInferenceBenchmarks

A package for generating benchmark and test reports for
[TensorInference.jl](https://github.com/TensorBFS/TensorInference.jl).

[![CI](https://github.com/TensorBFS/TensorInferenceBenchmarks.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/TensorBFS/TensorInferenceBenchmarks.jl/actions/workflows/CI.yml)

# Benchmarks

We use [PkgBenchmark.jl](https://github.com/JuliaCI/PkgBenchmark.jl) to run the
benchmark suite defined in `TensorInferenceBenchmarks/benchmark/benchmarks.jl`.
This benchmark uses the networks presented in the [UAI 2014 Inference
Competition](https://personal.utdallas.edu/~vxg112130/uai14-competition/index.html) .

To start a benchmark instance, activate the `TensorInferenceBenchmarks.jl` project
and run:

```julia
using TensorInferenceBenchmarks
benchmark()
```

The results of each benchmark instance is stored in a newly created directory
inside `TensorInferenceBenchmarks/benchmark/benchmark_results/`. The name of this
new directory is based on the host name, and current date and time.

# Test reports

The test reports are generated using
[TestReports.jl](https://github.com/JuliaTesting/TestReports.jl). To generate a
test report, activate the TensorInferenceBenchmarks.jl project and run:

```julia
using TensorInferenceBenchmarks
test()
```

The tests that are run are the standard Julia package tests for
`TensorInferenceBenchmarks.jl` stored inside the `test` directory. Each test
report is stored in a newly created directory inside
`TensorInferenceBenchmarks/test/test_reports/`. The name of this new directory is
based on the host name, and current date and time.

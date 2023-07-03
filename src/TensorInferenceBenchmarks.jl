module TensorInferenceBenchmarks

using PkgBenchmark, Dates, TestReports

export benchmark, test

"""
    benchmark_dirname()

Return a date-time string to be used as directory name for a benchmark
Format based on: https://serverfault.com/a/370766
"""
function benchmark_dirname()
    joinpath(gethostname(), Dates.format(now(), "yyyy-mm-dd--HH-MM-SS"))
end

"""
    benchmark()

Start a benchmark of TensorInference.jl and store the results. The results are
stored in
`TensorInferenceBenchmarks/benchmark/benchmark_results/<hostname>/<date-time>/`
"""
function benchmark()

    # Configure the benchmark (note that the `config` is passed as an arg to `benchmarkpkg`)
    config = BenchmarkConfig(
        id = nothing, # git id (`nothing` means the current state of the pkg)
        juliacmd = `julia`,
        env = Dict("JULIA_NUM_THREADS" => 1)
    )

    # Run the benchmark suite
    results = benchmarkpkg(
        "TensorInferenceBenchmarks",
        config;
        script = "benchmark/benchmarks.jl",
        retune = true
    )

    # Create a directory for the current benchmark based on the current date and time
    root_module_path = pathof(TensorInferenceBenchmarks) |> dirname |> dirname
    benchmark_results_path = joinpath(root_module_path, "benchmark", "benchmark_results")
    current_benchmark_path = joinpath(benchmark_results_path, benchmark_dirname())
    mkpath(current_benchmark_path)

    # Write results
    writeresults(joinpath(current_benchmark_path, "results.txt"), results)

    # Export to Markdown
    export_markdown(joinpath(current_benchmark_path, "summary.md"), results)
end

"""
    test()

Test TensorInferenceBenchmarks.jl (this package) and generate JUnit XMLs reports
"""
function test()

    # Create a directory for the current test report based on the current date and time
    root_module_path = pathof(TensorInferenceBenchmarks) |> dirname |> dirname
    test_reports_path = joinpath(root_module_path, "test", "test_reports")
    current_test_report_path = joinpath(test_reports_path, benchmark_dirname())
    mkpath(current_test_report_path)

    TestReports.test(
        "TensorInferenceBenchmarks",
        logfilepath = current_test_report_path,
        logfilename = "testlog.xml"
    )
end

end # module

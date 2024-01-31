module BenchMar

using BenchmarkTools
using TensorInference
using Artifacts
#using CUDA
#CUDA.allowscalar(false)

const SUITE = BenchmarkGroup()

problem = problem_from_artifact("uai2014", "MAR", "Promedus", 14)
evidence = read_evidence(problem)

tn = TensorNetworkModel(
  read_model(problem);
  optimizer = TreeSA(ntrials = 1, niters = 5, βs = 0.1:0.1:100),
  evidence,
)

SUITE["mar"] = @benchmarkable marginals(tn)
#SUITE["mar-cuda"] = @benchmarkable marginals(tn; usecuda = true)

end  # module
BenchMar.SUITE

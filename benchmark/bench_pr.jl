module BenchMap

using BenchmarkTools
using TensorInference
using Artifacts

const SUITE = BenchmarkGroup()

problem = problem_from_artifact("uai2014", "PR", "Pedigree", 11)

tn = TensorNetworkModel(
  read_model(problem);
  optimizer = TreeSA(ntrials = 1, niters = 5, βs = 0.1:0.1:100),
  evidence = read_evidence(problem),
)

SUITE["pr"] = @benchmarkable probability(tn) |> first |> log10

end  # module
BenchMap.SUITE

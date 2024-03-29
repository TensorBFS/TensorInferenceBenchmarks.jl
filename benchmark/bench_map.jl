module BenchMap

using BenchmarkTools
using TensorInference
using Artifacts

const SUITE = BenchmarkGroup()

problem = problem_from_artifact("uai2014", "MAP", "Promedas", 70)

tn = TensorNetworkModel(
  read_model(problem);
  optimizer = TreeSA(ntrials = 1, niters = 5, βs = 0.1:0.1:100),
  evidence = read_evidence(problem),
)

SUITE["map"] = @benchmarkable most_probable_config(tn)

end  # module
BenchMap.SUITE

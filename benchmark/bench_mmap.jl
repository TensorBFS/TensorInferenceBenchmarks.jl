module BenchMmap

using BenchmarkTools
using TensorInference
using Artifacts

const SUITE = BenchmarkGroup()

problem = problem_from_artifact("uai2014", "MMAP", "Segmentation", 12)
model = read_model(problem)
optimizer = TreeSA(ntrials=1, niters=2, βs=1:0.1:40)
evidence = read_evidence(problem)

mmap1 = MMAPModel(
  model;
  optimizer,
  evidence,
  queryvars = read_queryvars(problem),
)
SUITE["mmap-1"] = @benchmarkable maximum_logp(mmap1)

# Does not marginalize any var
mmap2 = MMAPModel(
  model;
  optimizer,
  evidence,
  queryvars = collect(1:(model.nvars)),
)
SUITE["mmap-2"] = @benchmarkable maximum_logp(mmap2)

# Marginalizes all vars
mmap3 = MMAPModel(
  model;
  optimizer,
  evidence,
  queryvars = Int[],
)
SUITE["mmap-3"] = @benchmarkable most_probable_config(mmap3)

end  # module
BenchMmap.SUITE

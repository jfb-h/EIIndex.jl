using EIIndex
using Test
using LightGraphs

N = 1000; L = 10000; G = 3; S = 1000
g = erdos_renyi(N, L)
groups = rand(1:G, N)
cug = cugtest_edges(g, x -> ei_global(x, groups), S)
plot(cug, xlabel="EI-Index")

# @testset "EIIndex.jl" begin
#     # Write your tests here.
# end

using EIIndex
using Test
using LightGraphs

g = erdos_renyi(50, 250)
groups = rand([1,2,3], 50)
cug = cugtest_edges(g, x -> ei_global(x, groups), 500)
plot(cug, xlabel="EI-Index")

# @testset "EIIndex.jl" begin
#     # Write your tests here.
# end

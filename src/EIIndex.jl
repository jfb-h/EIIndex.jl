module EIIndex

using LightGraphs
using LightGraphs.SimpleGraphs
using Plots: histogram, vline!
import Plots: plot

export ei_global, ei_group, ei_indiv, cugtest_edges, plot

include("ei_index.jl")
include("cugtest.jl")

end#module
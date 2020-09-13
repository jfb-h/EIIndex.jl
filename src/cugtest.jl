
struct CUGResult 
    obsval::Real
    randval::AbstractVector
    iter::Int
end

function cugtest_edges(g::AbstractGraph, f::Function, iter::Integer)
    
    e = ne(g); n = nv(g)
    tv = f(g)
    
    res = zeros(iter)
    for i in 1:iter
        gi = erdos_renyi(n, e)
        res[i] = f(gi)
    end
    
    return CUGResult(tv, res, iter)
end

function plot(t::CUGResult; xlabel="Test statistic")  
    histogram(t.randval, label="Replications", xlabel=xlabel)
    vline!([t.obsval], label="Observed", linewidth=2, color=:red, linestyle=:dash)
end

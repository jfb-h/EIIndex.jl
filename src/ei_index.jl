
function ei_global(g::SimpleGraph, groups::AbstractVector)
    L = ne(g)
    E = 0

    @inbounds for (i, e) in enumerate(edges(g))
        groups[src(e)] == groups[dst(e)] &&  (E += 1)
    end
    
    E = sum(ext)
    I = L - E

    return (E - I) / L
end


function ei_group(g::SimpleGraph, groups::AbstractVector)

    ng = maximum(groups)
    E = zeros(ng)
    I = zeros(ng)

    @inbounds for v in vertices(g)
        @inbounds for nb in neighbors(g, v)
            if groups[v] == groups[nb] 
                I[groups[v]] += 1
            else
                E[groups[v]] += 1
            end
        end
    end

    ei =  (E .- I ) ./ (E .+ I)

    return Dict(collect(1:ng) .=> ei)
end


function ei_indiv(g::SimpleGraph, groups::AbstractVector)

    I = zeros(nv(g))
    @inbounds for v in vertices(g)
        @inbounds for nb in neighbors(g, v)
            if groups[v] == groups[nb] 
                I[v] += 1
            end
        end
    end

    deg = degree(g)
    E = deg .- I

    return  (E .- I) ./ deg
end

using Plots
function plotsegments(segments::Vector{Tuple{Float64,Float64}}; kwargs...)
    p=plot(;kwargs...)
    for s in segments
        plot!(collect(s); kwargs...)
    end
    return p
end

seg=[s for s in zip([1.0,2.0,3.0],[10.0,20.0,30.0])]

plotsegments(seg; linecolor=:green, markershape=:circle, markercolor=:blue)
using .Vector2Ds
Point=Vector2D
Segment{T<:Real} = Tuple{Point{T},Point{T}}

function intersect((A₁,B₁)::Segment, (A₂,B₂)::Segment)    
    A = [B₁[2]-A₁[2]  A₁[1]-B₁[1]
         B₂[2]-A₂[2]  A₂[1]-B₂[1]]

    b = [A₁[2]*(A₁[1]-B₁[1])+A₁[1]*(B₁[2]-A₁[2])
         A₂[2]*(A₂[1]-B₂[1])+A₂[1]*(B₂[2]-A₂[2])]

    x,y = A\b

    if isinner((x, y), (A₁,B₁))==false || isinner((x, y), (A₂,B₂))==false
        return nothing
    end

    return (x,y)
end

isinner(P::Point, (A,B)::Segment) = 
    (A[1] <= P[1] <= B[1] || A[1] >= P[1] >= B[1]) &&
    (A[2] <= P[2] <= B[2] || A[2] >= P[2] >= B[2])

seg=[s for s in zip([0.0,6.0,0.0,6.0],[0.0,6.0,6.0,0.0])]

function otr_points(seg; kwargs...)
    p=plot(;kwargs...)
    i=1
    otr=[]
    while i<length(seg)
        push!(otr,[seg[i],seg[i+1]])
        i=i+2 
    end
    ss=[]
    for i in 1:length(otr)
        for j in i:length(otr)
            if i!=j
                push!(ss,intersect((otr[i][1],otr[i][2]),(otr[j][1],otr[j][2])))
            end
        end
    end
    for i in otr
       plot!([i[1][1],i[2][1]],[i[1][2],i[2][2]]; kwargs...) 
    end
    for i in ss
        scatter!(i;legend=false,markercolor=:red)
    end
    return p
end

otr_points(seg; linecolor=:green, markershape=:circle, markercolor=:blue)
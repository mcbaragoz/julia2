otr=[(1,-1),(5,7)]

using Plots
function where_points(seg,otr)
    p=plot()
    a=otr[1][2]-otr[2][2]
    b=otr[2][1]-otr[1][1]
    c=otr[1][1]*otr[2][2]-otr[1][2]*otr[2][1]
    #Ax+By+C=0
    a1=[]
    a2=[]
    a3=[]
    for i in seg
        k=a*i[1]+b*i[2]+c
        if k>0
            push!(a1,i)
        elseif k==0
            push!(a2,i)
        else
            push!(a3,i)
        end
    end
    plot!([otr[1][1],otr[2][1]],[otr[1][2],otr[2][2]]; linecolor=:green, markershape=:circle, markercolor=:blue)
    for i in a1
        scatter!(i;legend=false,markercolor=:red)
    end
    for i in a2
        scatter!(i;legend=false,markercolor=:orange)
    end
    for i in a3
        scatter!(i;legend=false,markercolor=:yellow)
    end
    return p
end

where_points(seg,otr)
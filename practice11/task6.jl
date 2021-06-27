points=[s for s in zip([0.0,3.0,6.0,2.0,6.0],[0.0,6.0,4.0,3.0,0.0])]

mnog=[s for s in zip([1.0,0.0,3.0,5.0,4.0,2.0,1.0],[0.0,2.0,7.0,2.0,-3.0,1.0,0.0])]

function in_mnog(points,mnog)
    pairs=[]
    u=1
    while u<length(mnog)
        push!(pairs,[mnog[u],mnog[u+1]])
        u=u+1
    end
    ins=[]
    out=[]
    for p in points
        ugol=0
        for i in pairs
            vec1=(p[1]-i[1][1],p[2]-i[1][2])
            vec2=(p[1]-i[2][1],p[2]-i[2][2])
            ugol=ugol+acos(cos(vec1,vec2))*180/pi
        end
        if round(ugol)>=359
            push!(ins,p)
        else
            push!(out,p)
        end
    end
    p=plot()
    for x in out
        scatter!(x;legend=false,markercolor=:blue)
    end
    for x in ins
        scatter!(x;legend=false,markercolor=:red)
    end
    plot!(mnog)
    return p
end

in_mnog(points,mnog)
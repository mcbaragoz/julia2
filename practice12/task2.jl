points=[s for s in zip([1.0,0.0,5.0,5.5,19.0,7.0,3.0,4.5],[0.0,6.0,7.0,5.0,-5.0,5.5,4.0,1.0])]

function rot(a,b,c)
    return pi>=ug((b[1]-a[1],b[2]-a[2]),(c[1]-a[1],c[2]-a[2]))  #ug - функция из 1 задачи
end

function grehom(points)
    res=[]
    push!(res,points[1])
    m=1
    for i in 1:length(points)
        if reverse(points[i])<reverse(res[1])
            res[1]=points[i]
        end
    end
    for i in 2:length(points)
        j = i
        while j>1 && rot(points[1],points[j-1],points[j]) 
          points[j], points[j-1] = points[j-1], points[j]
          j -= 1
        end
    end
    s = [points[1],points[2]]
    for i in 2:length(points)
        while rot(s[length(s)-1],s[length(s)],points[i]) && length(s)>2
          pop!(s)
        end
        push!(s,points[i])
    end
    push!(s,s[1])
    return s
end

res=grehom(points)

x=[]
y=[]
for a in res
    push!(x,a[1])
    push!(y,a[2])
end

mnog=[s for s in zip(x,y)]

using Plots
p=plot()
scatter!(points;legend=false,markercolor=:blue)
plot!(mnog, linecolor=:green,markershape=:circle,markercolor=:red)
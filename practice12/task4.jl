points=[s for s in zip([1.0,0.0,5.0,5.5,19.0,7.0,3.0,4.5],[0.0,6.0,7.0,5.0,-5.0,5.5,4.0,1.0])]

function plosh_treug(points)
    s=0
    for i in 2:length(points)
        s=s+1/2*(-points[i-1][1]*points[i][2]+points[i-1][2]*points[i][1])
    end
    return s
end
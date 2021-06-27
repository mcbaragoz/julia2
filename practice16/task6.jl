function optpathfloyd(next::AbstractMatrix, i::Integer, j::Integer)
    p = [i]
    f = i
    while (fin!=j)
        push!(p,next[f,j])
        f = next[f,j]
    end
    return p
end
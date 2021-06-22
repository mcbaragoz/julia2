function factor(n)
    if n == 1 || n == 0
        return n
    end
    divs = [1, n]
    spqr = convert(Int, (ceil(sqrt(n))))
    for i in 2:spqr
        if mod1(n,i) == 0
            push!(divs, i)
            push!(divs, n/i)
        end
    end
    return divs
end

print(factor(105))
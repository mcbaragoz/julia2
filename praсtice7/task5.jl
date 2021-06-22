function eratosphen(n)
    numbers = fill(true, n)
    new = []
    for i in 2:n
        if numbers[i] == true
            push!(new, i)
            for j in (2*i):i:n
                numbers[j] = false 
            end
        end
    end
    return new
end

println(eratosphen(61))
function partial_sort1!(A, b)
    A1 = []
    A2 = []
    A3 = []
    for x in A
        if x < b
            push!(A1, x)
        elseif x == b
            push!(A2, x)
        else
            push!(A3, x)
        end
    end
    A = append!(A1, A2)
    A = append!(A, A3)
    return A
end

function partialsort!(A, b)
    l = 1
    r = length(A)
    while l < r
        while A[r] > b 
            r -= 1
        end

        while A[l] <= b
            l += 1 
        end
        if r > l
            A[l], A[r] = A[r], A[l]
        end
    end
    return A
end

L1 = [3, 7, 5, 1, 2]
L4 = [3, 7, 5, 1, 2]
L2 = partial_sort1!(L1, 4)
L3 = partialsort!(L4, 4)
println("Различные версии частичной сортировки:")
println(L2)
println(L3)
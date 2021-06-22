function partsort!(A, b)
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
    i = length(A1)
    j = length(A1) + length(A2)
    A = append!(A1, A2)
    A = append!(A, A3)
    return A, i, j
end

function k_statistics(a, k::Int)
    if length(a) < 2
        return a[1]
    end
    a, i, j = partsort!(a, a[(1+length(a)) ÷ 2])
    if k <= i
        return k_statistics(a[1:i], k)
    elseif i < k < j+1
        return a[k]
    else
        return k_statistics(a[j+1:end], k - j)
    end
    return a[k]
end

function median(a)
    if length(a) % 2 == 0
        return k_statistics(a, length(a) ÷ 2)
    else
        return k_statistics(a, (length(a) ÷ 2 + 1))
    end
end

L1 = [7, 7, 4, 5, 9, 0]

println("Нахождение медианного значения в отсортированном массиве L1: ", k_statistics(L1, median(L1)))
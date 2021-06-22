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

function partsort2!(A, b)
    A1 = Vector{eltype(A)}(undef, length(A))
    A2 = Vector{eltype(A)}(undef, length(A))
    A3 = Vector{eltype(A)}(undef, length(A))
    i, j, k = 1, 1, 1
    for x in A
        if x < b
            A1[i] = x
            i+=1
        elseif x == b
            A2[j] = x
            j+=1
        else
            A3[k] = x
            k += 1
        end
    end
    i -= 1
    j -= 1
    k -= 1
    for count in 1:i
        A[count] = A1[count]
    end
    for count in i+1:i+j
        A[count] = A2[count - i]
    end
    for count in i+j+1:i+j+k 
        A[count] = A3[count - i - j]
    end
    return A, i, i+j
end

function quicksort!(a)
    if length(a) < 2
        return a
    end
    a, i, j = partsort!(a, a[(1+length(a)) ÷ 2])
    a[1:i] = quicksort!(a[1:i])
    a[j+1 : end] = quicksort!(a[j+1:end])
    return a
end

function quicksort_!(a)
    if length(a) < 2
        return a
    end
    a, i, j = partsort2!(a, a[(1+length(a)) ÷ 2])
    a[1:i] = quicksort_!(a[1:i])
    a[j+1 : end] = quicksort_!(a[j+1:end])
    return a
end

L1 = [3, 7, 5, 1, 2]
L2 = [7, 7, 4, 9, 0]

println("Реализация быстрой сортировки при помощи частичной сортировки на примере вектора L1: ", quicksort!(L1))
print("Реализация быстрой сортировки при помощи частичной сортировки на примере вектора L2: ", quicksort_!(L2))
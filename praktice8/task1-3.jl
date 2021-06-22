function merge(A,B)
    C = promote_type(eltype(A), eltype(B))[]
    i, j = 1, 1
    n, m = 1, 1
    while i <= length(A)  || j <= length(B) 
        while i <= length(A) && ( A[i] <= B[m] || j > length(B))
            push!(C, A[i])
            i += 1
            n += 1
        end
        if n > length(A)
            n -= 1
        end
        while j <= length(B) && (B[j] <= A[n] || i > length(A))
            push!(C,B[j])
            j += 1
            m += 1
        end
        if m > length(B)
            m -= 1
        end
    end

    return C
end

function mergesort!(a)
    if length(a) == 1
        return a
    end
    a1 = mergesort!(a[1:end ÷ 2]) 
    a2 = mergesort!(a[end ÷ 2 + 1:end])
    merge(a1, a2)
end

A = [10
     60]

B = [5
     90]

C = merge(A, B)

println(C)



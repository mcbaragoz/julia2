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

A = [10 20
     60 70]

B = [40 50
     90 95]
C = merge(A, B)

println("Массив C, состоящий из отсортированных элементов A и В: ", C)
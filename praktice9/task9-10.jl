function findMaxAbsInColumn(A::Matrix, k)
    rows, _ = size(A)
    maxPosition = k
    for i in k+1:rows
        if abs(A[i, k]) > abs(A[maxPosition, k])
            maxPosition = i
        end
    end

    return maxPosition
end

function column_to_zeroes!(A, k, maxPosition)
    if maxPosition != k
        A[k, :], A[maxPosition, :] = A[maxPosition, :], A[k, :]
    end

    if isapproxzero(A[k,k])
        for i in k:lastindex(A,1)
            A[i, k] = 0
            return
        end
    end

    for i in k+1:(lastindex(A, 1))
        if isapproxzero(A[i,k])
            A[i,k] = 0
            continue
        end
        t = -A[i,k]/A[k,k]
        A[i, i:end] += t *(A[k, i:end])
        A[i,k] = 0 #Чтобы вместо нуля не было каких-то очень маленьких чисел 
    end
end

function convert!(A)
    rows, columns = size(A)
    for k in 1:rows
        imax = findMaxAbsInColumn(A, k)
        column_to_zeroes!(A, k, imax)
    end
end

function inv(A)
    rows, columns = size(A)
    E = A^0
    D = Matrix{eltype(A)}(undef, rows, 2columns)
    for i in 1:rows
        D[i, :] = append!(copy(A[i, :]), E[i, :])
    end
    convert!(D)
    for i in 1:rows
        E[i, :] = D[i, rows+1:2rows]
    end

    return E
end

A = [1 2 3
     0 2 4
     0 0 3]

println(inv(A))
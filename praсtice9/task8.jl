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

function issingular_convert!(A)
    rows, columns = size(A)
    for k in 1:columns
        imax = findMaxAbsInColumn(A, k)
        column_to_zeroes!(A, k, imax)
        if A[k, k] == 0 
            return false
        end
    end

    return true
end

function det(A)
    isntDegenerate = issingular_convert!(A)
    if isntDegenerate == false
        return eltype(A)(0)
    else
        det = eltype(A)(1)
        for i in 1:lastindex(A, 1)
            det *= A[i, i]
        end
        return det
    end
end

A = [1 2 3
     0 2 4
     0 0 3]

println(det(A))
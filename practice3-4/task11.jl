function transpose(A::Matrix)
    B = Matrix{Int}(undef, size(A, 2), size(A, 1))
    #reshape(B, (size(A, 2), size(A, 1)))
    for i in 1:size(A, 1)
        for j in 1:size(A, 2)
            B[j, i] = A[i, j]
        end
    end
    return B
end

L1 = [1 5 8 2
      2 3 4 1]

L = transpose(L1)
print(L)

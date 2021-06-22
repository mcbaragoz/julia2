function nunmax(A)
    n = length(A)
    max = A[1]
    k = 0
    for i in 2:n
        if A[i] > max
            max = A[i]
        end
    end
    for i in 1:n
        if A[i] == max
            k += 1
        end
    end
    return k
end

L1 = [3, 7, 7, 1, 7]

len_max = nunmax(L1)
print("Нахождение количества максимумов в векторе L1: ", len_max)
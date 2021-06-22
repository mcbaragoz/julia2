function findallmax(A)
    n = length(A)
    max = A[1]
    indexes = Vector{Int}(undef, 0)
    for i in 2:n
        if A[i] > max
            max = A[i]
        end
    end
    k = 1
    for i in 1:n
        if A[i] == max
            push!(indexes, i)
            k += 1
        end
    end
    return indexes
end

#Проверка функции
L1 = [3, 7, 7, 1, 7]
indexes = findallmax(L1)
print("Нахождение индексов максимума в векторе L1: ", indexes)
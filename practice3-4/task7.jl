function deleteat_user!(A::AbstractVector, n::Int)
    #B = Vector{Int}(undef, length(A)-1)
    #i = 0
    for i in n:length(A)-1
        A[i] = A[i+1]
    end
    resize!(A, length(A)-1)
    return(A)
end

function insert_user!(A::AbstractVector, n::Int, k)
    # for i in n:length(A)+1
    resize!(A, length(A)+1)
    for i in length(A)-1:-1:n
        A[i+1] = A[i]
    end
    A[n] = k
    return A
end

#Проверка функции
L1 = [1, 5, 8, 2]
print("Вектор L1 без второго элемента: ", deleteat_user!(L1, 2))
print("\nВставка 3 на 4 место вектора L1: ", insert_user!(L1, 4, 3))

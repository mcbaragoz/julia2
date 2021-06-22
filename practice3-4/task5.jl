function slice(A::AbstractVector,p::Vector{Int})::AbstractVector 
    b = []
    for x in p
        push!(b, A[x])
    end
    return b
end

#Проверка функции
L1 = [8, 7, 2, 3, 5]
indexes = [1, 4, 5]

print("Первый, четвертый и пятый элемент массива L1: ", slice(L1, indexes))

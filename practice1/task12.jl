
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

function findallmax(f::Function, a)
    a1 = copy(a)
    for i in 1:length(a1)
        a1[i] = f(a1[i])
    end
    return findallmax(a1)
end

function squaring(a)
    res = a * a
    return res
end


#Проверка функций
L1 = [-11, 10, 8, -11, 9]
k = findallmax(squaring, L1)
print("Нахождение индексов максимума в векторе L1 после применения функции: ", k)


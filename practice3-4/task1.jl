#Индексы максимумов массива без привязки к типу индексирования
function findallmax(A)
    i_max=[firstindex(A)]
    for i in firstindex(A)+1:lastindex(A)
        if A[i]>A[i_max[end]]
            i_max=[i]
        elseif A[i]==A[i_max[end]]
            push!(i_max, i)
        end
    end
    return i_max
end

L1 = [3, 7, 7, 1, 7]
indexes = findallmax(L1)
print("Нахождение индексов максимума в векторе L1: ", indexes)
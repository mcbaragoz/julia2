#Копирование вектора
function copy_user(L1::Vector{Int})
    L2 = Vector{Int}(undef, length(L1))
    for j in 1:length(L1)
        L2[j] = L1[j]
    end
    return L2
end
#Копирование массива
function copy_user(A::Matrix, dim = (2, 2))
    len_rows, len_columns = dim
    B = Matrix{Int}(undef, len_rows, len_columns)
    for j in 1:len_rows
        B[j, :] = (view(A,j,:)) 
    end
    return B
end

#Проверка функций
L1 = Vector{Int}(undef, 3)
L1 = [2, 3, 5]
L3 = copy_user(L1)

A = [10 20
     30 40]
B = copy_user(A::Matrix, (2, 2))


print("Копия вектора L1: ", L3, "\n")
print("Копия массива A: ", B)

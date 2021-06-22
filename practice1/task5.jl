#Сортровка вектора по ключевым значениям
function sortkey!(a, key_values)
    l = length(key_values)
    m = Vector{Int}(undef, l)
    for i in 1:l
        m[i] = a[key_values[i]]
    end
    sort!(m)
    for i in 1:l
        a[key_values[i]] = m[i]
    end
    return(a)
end

function bubblesortperm!(a)
    n = length(a)
    indexes = collect(1:n)
    for k in 1:n-1
        istranspose = false
        for i in 1:n-k
            if a[i]>a[i+1]
                a[i],a[i+1]=a[i+1],a[i]
                indexes[i],indexes[i+1]=indexes[i+1],indexes[i]
                istranspose = true
            end
        end
        if istranspose == false
            break
        end
    end
    return indexes
end

function sortkey!(A::Matrix, f::Function)
    arr = zeros(size(A, 2))
    for i in 1:size(A, 2)
        arr[i] = f(A, i)
    end
    ind = bubblesortperm!(arr)
    B = copy(A)
    for i in 1:size(A, 2)
        A[:, i] = B[:, ind[i]]
    end
    return(A)
end

function summ_sort!(A::Matrix, k::Int)
    l1 = size(A, 1)
    m = 0
    #k = zeros(l1) #вектор длины l2
    for j in 1:l1
        m += A[j, k]
    end
    return m
end

function null_sort!(A::Matrix, k::Int)
    l1 = size(A, 1)
    m = 0
    #k = zeros(l1) #вектор длины l2
    for j in 1:l1
        if (A[j, k] == 0)
            m += 1
        end
    end
    return m
end

A = [10 20 30 40 50
     60 70 80 90 95
     15 25 35 45 55
     65 75 85 96 97]

B = [1 0 4
     0 2 2
     0 5 1 ]
#print(B)
C = sortkey!(copy(B), summ_sort!)
D = sortkey!(B, null_sort!)
#l = summ_sort!(A)
print("Сортировка столбцов матрицы B по возрастанию сумм: ", C, "\n")
print("Сортировка столбцов матрицы В по количеству нулей: ", D, "\n")

a = [1, 8, 6, 2, 5, 3]
key_values = [2, 4, 5]
a1 = sortkey!(a, key_values)
print("Сортировка вектора a по ключевым значениям: ", a1) 

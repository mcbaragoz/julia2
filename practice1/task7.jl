function insertsort!(a)
    n = length(a)
    for i in 2:n
        j = i - 1
        while j > 0 && a[j] > a[j + 1]
            a[j+1], a[j] = a[j], a[j+1]
            j -= 1
        end 
    end
    return a    
end

function insertsortperm!(a)
    n = length(a)
    indexes = collect(1:n)
    for i in 2:n
        j = i - 1
        while j > 0 && a[j] > a[j + 1]
            a[j+1], a[j] = a[j], a[j+1]
            indexes[j+1], indexes[j] = indexes[j], indexes[j+1]
            j -= 1
        end 
    end
    return indexes
end

insertsort(a) = insertsort!(copy(a))
insertsortperm(a) = insertsortperm!(copy(a))

#Проверка функций

L1 = [3, 7, 5, 1, 2]

print("Массив отсортированных индексов: ", insertsortperm(L1), "\n")
print("Отсортированный массив: ", insertsort!(L1), "\n")
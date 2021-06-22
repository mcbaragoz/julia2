#Сортировка вектора пузырьком
function bubblesort!(x)
    n = length(x)
    for i in 1:n
        for j in 1:(n-i)
            if x[j] > x[j+1]
                x[j+1], x[j] = x[j], x[j+1]
            end
        end
    end
end
#Сортировка вектора пузырьком с возвратом индексов элементов в порядке возрастания
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


#Сортировка массива с последующей записью в новый массив (исходный остается неизменным)
bubbleSort(x) = bubbleSort!(copy(x)) 
bubblesortperm(x) = bubblesortperm!(copy(x))

#Проверка функций
L1 = [3, 2, 5, 10, 1, 8, 7, 2]

K = bubblesortperm(L1)
bubblesort!(L1)

print("Вектор, отсортированный пузырьком: ", L1, "\n")
print("Вектор индексов элементов в порядке возрастания: ", K)
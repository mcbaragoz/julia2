function bubblesort!(a)
    n = length(a)
    for k in 1:n-1
        istranspose = false
        for i in 1:n-k
            if a[i]>a[i+1]
                a[i], a[i+1] = a[i+1], a[i]
                istranspose = true
            end
        end
        if istranspose == false
            break
        end
    end
    return a
end

#Функция сортировки столбцов матрицы
function bubblesort!(A::Matrix)
    for j in 1:size(A, 2)
        bubblesort!(view(A,:,j)) 
    end
    return A
end

#Проверка функции
A = [10 20 30 40 50
     60 70 80 90 95
     15 25 35 45 55
     65 75 85 96 97]

bubblesort!(A)
print("Массив с отсортированными столбцами:", A, )
function bubblesortmodified!(a)
    k = 0
    n = length(a)
    while n - k != 1
        for i in 2:n-k
            if a[i] < a[i - 1]
                a[i], a[i-1] = a[i-1], a[i]
            end
        end
        k+=1
    end
    return a
end

#Проверка функций
L1 = [3, 2, 5, 10, 1, 8, 7, 2]

bubblesortmodified!(L1)

print("Вектор, отсортированный пузырьком: ", L1, "\n")
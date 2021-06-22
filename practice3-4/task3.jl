function shenker_sort(a)
    len = length(a)
    k = 1
    transpose = false
    for i in 1:len
        transpose = false
        for i in 1:len-k
            if a[i]>a[i+1]
                a[i],a[i+1]=a[i+1],a[i]
            end
            transpose = true
        end

        for i in len-k-1:-1:1
            if a[i+1] < a[i]
                a[i], a[i+1] = a[i+1], a[i]
            end
            transpose = true
        end
        if transpose == false
            break
        end
        k += 1
    end
    return a
end

L1 = [-11, 10, 8, -11, 9, 1, 4, 5]

#Проверка функции
print("Массив с применением шенкерной сортировки: ", shenker_sort(L1))
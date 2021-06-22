# function unique(l::AbstractVector)
#     a = sort(l)
#     i = 1
#     while a[i] != maximum(a)
#         if a[i] == a[i+1]
#             deleteat!(a, i)
#         end
#         i +=1
#     end
#     return(a)
# end


function unique(l::AbstractVector)
    a = sort(l)
    #m = length(a)
    i = 1
    while i != length(a)
        if a[i] == a[i+1]
            deleteat!(a, i)
            resize!(a, length(a)-1)
            continue
        end
        i += 1
    end
    return(a)
end

function unique!(l::AbstractVector)
    sort!(l)
    i = 1
    while i != length(l)
        if l[i] == l[i+1]
            deleteat!(l, i)
            resize!(l, length(l)-1)
            continue
        end
        i += 1
    end
    return(l)
end

function allunique(l::AbstractVector)
    sort!(l)
    i = 1
    unique = true
    while i != length(l)-1
        if l[i] == l[i+1]
            unique = false
            break
        end
        i += 1
    end
    return(unique)
end

# function unique(l::AbstractVector)
#     a = sort(l)
#     while a[i] != max(a)
#         if a[i] == a[i+1]
#             deleteat!(a, i+1)
        
#         end
#     end
#     return(a)
# end


#Проверка функций
L1 = [1, 5, 8, 8, 2, 1, 3]
u1 = allunique(L1)
L = unique(L1)
print("Только уникальные элементы L1, записанные в новый вектор: ", L)
print("\nИзмененный вектор L1, сожержащий только уникальные значения: ", unique!(L1))
u2 = allunique(L1)
print("\nРезультат работы функции allunique до и после применения функции unique! к вектору L1:\n", u1, "\n", u2)
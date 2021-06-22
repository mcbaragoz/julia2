function reverse_!(a::Vector)
    b = []
    for i in length(a):-1:1
        push!(b, i)
    end
    #print(b)
    a = permute_!(a, b)
end

# function permute_!(A::Vector, p)
#     B = copy(A)
#     for i in 1:length(A)
#         B[i] = A[p[i]]
#     end
#     A = B
#     return A
# end

function permute_!(a::AbstractVector, perm)
    for i in 1:length(a)
        j = 1
        while perm[j] != i
            j += 1
        end
        a[j],a[i] = a[i], a[j]
        perm[i], perm[j] = perm[j], perm[i] 
    end
end

#Проверка функции
L1 = [1, 5, 8, 8, 2, 1, 3]
reverse_!(L1)

println(reverse_!(L1))
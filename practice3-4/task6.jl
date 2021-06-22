# function permute_!(A::Vector,p::Vector{Int})
#     B = copy(A)
#     for i in 1:length(A)
#         B[i] = A[p[i]]
#     end
#     A = copy(B)
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

L1 = [1, 5, 8, 2]
per = [3, 1, 4, 2]
permute_!(L1, per)
#Проверка функции
print("Массив L1 после применения функции permute_!: ", L1)
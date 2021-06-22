# function calcsort(A::Matrix, m::Vector{Int})
#     columns = size(A, 2)
#     for i in 1:columns
#         arr[i] = values_count(A, i, m)
#         #function values_count(A::Matrix, k::Integer, m::Vector{<:Integer})
#     end
#     ind = bubblesortperm!(arr)
#     B = copy(A)
#     for i in 1:size(A, 2)
#         A[:, i] = B[:, ind[i]]
#     end
#     return(A)
# end

# function bubblesortperm!(a)
#     n = length(a)
#     indexes = collect(1:n)
#     for k in 1:n-1
#         istranspose = false
#         for i in 1:n-k
#             if a[i]>a[i+1]
#                 a[i],a[i+1]=a[i+1],a[i]
#                 indexes[i],indexes[i+1]=indexes[i+1],indexes[i]
#                 istranspose = true
#             end
#         end
#         if istranspose == false
#             break
#         end
#     end
#     return indexes
# end

function values_count(A, k, m)
    n = 0
    #k = zeros(l1) #вектор длины l2
    for i in 1:size(A,1), val in m
        if A[i, k] == val
            n += 1
        end
    end
    return n
end

A = [10 20 10 40 50
     10 70 80 90 95
     15 25 35 45 55
     65 75 85 96 97]

m = [10]

# B = calcsort(A, m)
print(values_count(A, 1, m))
#print(B)

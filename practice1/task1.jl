A = [10 20 30 40 50
     60 70 80 90 95
     15 25 35 45 55
     65 75 85 96 97]
#print(A)

#B = view(A,2,:)

#print(size(A, 1))

#print(reverse!(view(A,1,:)))

#print(B)
# print(size(A, 1))
function reverse_user!(A::Matrix)
    for j in 1:size(A, 1)
        reverse!(view(A,j,:)) 
    end

    for i in 1:size(A, 2)
       reverse!(view(A,:,i)) 
    end 
    return A
end

function reverse_user!(A::Matrix, dim = (2, 2))
    len_rows, len_columns = dim
    for j in 1:len_rows
        reverse!(view(A,j,:)) 
    end

    for i in 1:len_columns
        reverse!(view(A,:,i))
    end
    return A
end

function reverse_user!(L::Vector{Type})
    for j in 1:(length(L)-1)
        m = L[j]
        L[j] = L[length(L) - j + 1]
        L[length(L) - j + 1] = m
    end
    return L
end

#C = reverse_user!(A, (4, 5))
#print(C)

D = reverse_user!(A)
print(D)
#J::Vector{Int}
L1 = Vector{Int}(undef, 3)
#L2 = Vector{Float64}(undef, 3)
L1 = [2, 3, 5]
#L2 = [2.5, 3.5, 5.5]

reverse_user!(L1)
#reverse_user!(L2)

print(L1)
#print(L2)
# M = reverse_user!(A)

# print(M)

# function slice(A::Matrix,I::Vectot{Int},J::Vector{Int})
#     B=Matrix{eltype(A)}(undef,length(I),length(J))
#     for i in I
#         for j in J
#             B[i,j]=A[I[i],J[j]]
#         end
#     end
#     return B
# end

# B = slice(A, )
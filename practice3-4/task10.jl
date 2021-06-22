function cyclic_move!(a::Vector)
    temp = a[length(a)]
    for i in length(a):-1:2
        a[i] = a[i - 1]
    end
    a[1] = temp
end

function cyclic_move!(a::Vector, m::Int)
    for i in 1:m
        cyclic_move!(a)
    end
    return a
end

L1 = [1, 5, 8, 8, 2, 1, 3]
k = cyclic_move!(L1, 3)
print("Массив L1, сдвинутый на 3 позиции вперед: ", k)
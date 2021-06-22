function pow(a, n::Integer)
    k = a
    while n > 1
        if mod1(n,2) == 1
            a *= k
            n -= 1
        else
            a *= k
            k *= k
            n = n ÷ 2
        end 
    end
    return a
end

l = pow(2, 7)
print("Возведение двойки в седьмую степень: ", l)
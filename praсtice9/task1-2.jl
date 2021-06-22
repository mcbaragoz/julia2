function cosx(x, n)
    an = 1
    sn = 0
    m = 2
    sqrX = x^2
    for i in 0:(n+1)
        sn += an
        an = - an * sqrX /(m-1)/m
        m += 2
    end
    return sn
end

#Задача 2
function accurate_cosx(x)
    an = 1
    sqrX = x^2
    sn = 0
    m = 2
    while abs(an) > eps()
        sn += an
        an = - an * sqrX /(m-1)/m
        m += 2
    end

    return sn
end

a = cosx(4, 5)
b = accurate_cosx(4)

println("Приблизительное значение косинуса в точке 4: ", a)
println("Значение косинуса в точке 4 с машинной точностью: ", b)

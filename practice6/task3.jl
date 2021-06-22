#Реализация функции с использованием двух массивов длины n
function binomial_coeffs(n::Integer)::Vector{Int}
    if n == 1
        return [1]
    end
    if n == 2
        return [1, 1]
    end
    c = [1, 1]
    for i in 3:n
        c=[1, (view(c[1:end-1]) .+ view(c[2:end])), 1] 
    end
    return c
end

#Реализация функции с использованием только одного массива длины n
function binomial_coeffs1(n::Integer)
    if n == 1
        return [1]
    end
    if n == 2
        return [1, 1]
    end
    c = [1 , 1]
    m = 2
    for _ in 3:n
        for i in 1:(m - 1)
            c[i] = c[i] + c[i+1]
            m += 1
        end
        pushfirst!(c, 1)
    end
    return c
end
function gcd_ext(a, b)
    if b == 0
        return (1, 0, a)
    end
    y, x, c = gcd_ext(b, mod(a, b))
    return (x, y - (a ÷ b)*x, c)
end

function factor(n)
    if n == 1 || n == 0
        return n
    end
    divs = [1, n]
    spqr = convert(Int, (ceil(sqrt(n))))
    for i in 2:spqr
        if n%i == 0
            push!(divs, i)
            push!(divs, n/i)
        end
    end
    return divs
end

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

function inv(m::Integer, n::Integer)
    x, y, c = gcd_ext(m, n)
    if c != 1
        return nothing
    else
        while x < 0
            x += n
        end
        return x
    end
end

function zerodivisors(n)::Vector{Int}
    zeroes::Vector{Int} = []
    for i in 1:(n-1)
        if just_gcd(i, n) != 1
            push!(zeroes, i)
        end
    end
    return zeroes
end

function ord(a, p)
    orders = factor(p - 1)
    for x in orders
        if pow(a, x)%p == 1
            return x
        end
    end
end

println("Обратный элемент для тройки в кольце вычетов с основанием 5", inv(3, 5))
println("Все делители нуля для в кольце по основанию 20", zerodivisors(20))
println(ord(3, 5))
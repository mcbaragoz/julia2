function isprime(n::Int)::Bool
    k = convert(Int, (ceil(sqrt(n))))
    for i in 2:k
        if mod1(n, i) == 0 && i != n
            return false
        end
    end
    return true
end


println("Является ли число 61 простым?")

if (isprime(61) == true)
    println("ДА")
else
    println("НЕТ")
end
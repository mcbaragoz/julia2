function count_polynom(x::Number, p::Polynomial)::Number
    coeffs = copy(p.coeffs)
    reverse!(coeffs)
    result = coeffs[1]
    for i in 2:length(coeffs)
        result *= x
        result += coeffs[i]
    end
    return result
end

function integral(p::Polynomial)
    coeffs = copy(p.coeffs)
    newcoeffs = Vector{Number}(undef, 0)
    for i in length(coeffs):-1:1
        pushfirst!(newcoeffs, coeffs[i]*(1//i))
    end
    pushfirst!(newcoeffs, 0)
    return Polynomial(newcoeffs)
end

function count_integral(a::Number, b::Number, p::Polynomial)
    i_p = integral(p)
    result = count_polynom(b, i_p) - count_polynom(a, i_p)
    return result    
end

Poly1 = Polynomial([2,2,3,5])
res = count_integral(0, 5, Poly1)
println("Определенный интеграл от полинома Poly1: ", res)


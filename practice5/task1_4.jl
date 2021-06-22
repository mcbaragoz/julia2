using Polynomials
#Нахождение первой производной
function find_deriative(P::Polynomial)::Polynomial
    coeffs = P.coeffs
    if length(coeffs) <= 1
        return Polynomial([0])
    end
    newcoeffs = Vector{Number}(undef, 0)
    for i in 2:length(coeffs)
        push!(newcoeffs, (coeffs[i] * (i-1)))
    end
    return Polynomial(newcoeffs)
end
#Нахождение значения многочлена в точке
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

#Значение второй и третьей и n-ной производной в точке
function count_second_deriative(x::Number, p::Polynomial)::Number
    p1 = copy(p)
    for i in 1:2
        p1 = find_deriative(p1)
    end
    return count_polynom(x, p1)
end

function count_third_deriative(x::Number, p::Polynomial)::Number
    p1 = copy(p)
    for i in 1:3
        p1 = find_deriative(p1)
    end
    return count_polynom(x, p1)
end

function count_deriative(x::Number, p::Polynomial, k::Int)::Number
    for i in 1:k
        p = find_deriative(p)
    end
    return count_polynom(x, p)
end

diff(x::Number, p::Polynomial; ord = 1)::Number = count_deriative(x, p, ord)

p=Polynomial([3,4,6,2])

s = count_second_deriative(1, p)
t = count_third_deriative(1, p)
n = count_deriative(1, p, 1)
println("Значение второй производной многочлена 2x^3+6x^2+4x+3 в точке 1: ", s)
println("Значение третьей производной многочлена 2x^3+6x^2+4x+3 в точке 1: ", t)
print("Значение первой производной многочлена 2x^3+6x^2+4x+3 в точке: ", n)



function \(a::Polynomial, b::Polynomial)::Polynomial
    acoeffs = copy(a.coeffs)
    bcoeffs = copy(b.coeffs)
    return Polynomial(divrem(acoeffs, bcoeffs))
end

function %(a::Polynomial, b::Polynomial)::Polynomial
    acoeffs = copy(a.coeffs)
    bcoeffs = copy(b.coeffs)
    divrem(acoeffs, bcoeffs)
    return Polynomial(acoeffs)
end
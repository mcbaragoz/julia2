using Polynomials
using PyPlot

#Деление многочлена на многочлен по массиву его кожффициентов
function divrem(a::AbstractArray, b::AbstractArray)
    n = length(a)
    m = length(b)
    if m > n
        return [0]
    end
    coeffs = []
    for i in n:-1:m
        k = i
        coeff = a[i]//b[end]
        for j in m:-1:1
            a[k] -= coeff * b[j]
            k -= 1
        end
        pushfirst!(coeffs, coeff)
    end
    return coeffs, a
end

P1 = [1,2,3,5]
P2 = [2,4,1]
div, mod = divrem(P1, P2)

println("Частное и остаток от деления P1 на P2: ", div, mod)

function \(a::Polynomial, b::Polynomial)::Polynomial
    acoeffs = copy(a.coeffs)
    bcoeffs = copy(b.coeffs)
    divrem(acoeffs, bcoeffs)
    return Polynomial()
end

function %(a::Polynomial, b::Polynomial)::Polynomial
    acoeffs = copy(a.coeffs)
    bcoeffs = copy(b.coeffs)
    divrem(acoeffs, bcoeffs)
    return Polynomial(acoeffs)
end

Poly1 = Polynomial([2,2,3,5])
Poly2 = Polynomial([2,4,1])

Poly_res1 = Poly1\Poly2
Poly_res2 = Poly1%Poly2

println("Результат деления двух много членов ", Poly_res1)
println("Остаток от деления ", Poly_res2)
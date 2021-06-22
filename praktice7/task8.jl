function just_gcd(a, b)
    if a == b || b == 0 
        return a
    else
        return just_gcd(b, mod1(a,b))
    end
end

function gcd_ext(a, b)
    if b == 0
        return (1, 0, a)
    end
    y, x, c = gcd_ext(b, mod(a,b))
    return (x, y - (a ÷ b)*x, c)
end

function gcdExtended(a, b)
    # Base Case
    if a == 0 
        return (b, 0, 1)
    end       
    gcd, x1, y1 = gcdExtended(mod1(b,a), a)
    x = y1 - (b//a) * x1
    y = x1
    return gcd, x, y
end

function extended_gcd(a,b)
	if (b == 0)
		return (a,1,0)	
	else
		g,m,n = extended_gcd(b,mod(a,b))
		return(g,n,m-div(b,a)*n)
    end
end
# function gcd_extended(num1, num2)
#     if num1 == 0
#         return (num2, 0, 1)
#     else
#         k = mod1(num1,num2)
#         println(k)
#         if k > num1
#         div, x, y = gcd_extended(k, num1)
#     end
#     return (div, y - (num2 // num1) * x, x)
# end

a = 2
b = 9

m, n, k = gcd_ext(a, b)

println("Пример реализации обычного алгоритма евклида: ", just_gcd(a, b))
println("Пример реализации расширенного алгоритма евклида: ", gcd_ext(a, b))



function newton(r::Function, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
    x1 = x
    x2 = x + 2 * ε_x
    for i in 1:nmaxiter
        if (abs(x1 - x2) < ε_x || r(x1) < ε_y) && i > 1
            return x1
        end
        x2 = x1
        x1 = x1 - r(x1)
    end
    if abs(x1 - x2) < ε_x || r(x1) < ε_y
        return x1
    end
    return nothing
end

newton_cosx() = newton(x -> (-cos(x)/sin(x)), 0.5)

#Задача 3

newton(ff::Tuple{Function,Function}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20) = newton(x->ff[1](x)/ff[2](x), x;ε_x, ε_y, nmaxiter )

#Задача 4

newton(x) = newton((x->x - cos(x), x->sin(x)), x)

#Задача 5

newton1(ff, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)= newton(x->(y=ff(x); y[1]/y[2]), x; ε_x, ε_y, nmaxiter)

a = newton_cosx()

print(a)


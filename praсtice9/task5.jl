function besselj(m, x)
    sn = 0
    an = 1/factorial(m)
    k = 0
    while abs(an) > eps()
        sn += an
        an = -an * x * x/4/(k+1)/(k+m+1)
        k += 1
    end

    sn *= (x/2)^m

    return sn

end

function besselj_plots()
    x = 0:0.02:20
    y1, y2, y3, y4, y5, y6 =[], [], [], [], [], []
    for i in x
        push!(y1, besselj(0, i))
        push!(y2, besselj(1, i))
        push!(y3, besselj(2, i))
        push!(y4, besselj(3, i))
        push!(y5, besselj(4, i))
        push!(y6, besselj(5, i))
    end
    p = plot(x, y1)
    plot!(p, x, y2)
    plot!(p, x, y3)
    plot!(p, x, y4)
    plot!(p, x, y5)
    plot!(p, x, y6)
    display(p)

end
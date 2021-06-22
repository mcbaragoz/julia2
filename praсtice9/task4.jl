function ln(x)
    sn = 0
    k = 0
    bk =  -(1 - x)
    while abs(bk) > eps() 
        ak  = bk / (k+1)
        k += 1
        sn += ak
        bk *= (1-x)
    end
    return sn
end

println("Значение натурального логарифма в точке 4", ln(4))

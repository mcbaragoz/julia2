function dispersion(series)
    S¹ = eltype(series)(0)
    S² = eltype(series)(0)
    D, M = 0, 0
    for (n,a) in enumerate(series)
        S¹ += a
        S² += a^2
        M = S¹/n
        D = S²/n-M^2
    end
    return D, M
end

function currentstd(series, n::Int)
    a = series[1:n]
    D, l = dispersion(a)
    return D
end

function test_currentstd()
    series = randn(Float64, 50)
    D = currentstd(series, 50)
    plot(series)
    return D
end

k = test_currentstd()
println("Тест функции стандартное отклонение на 50 случайных объектах: ", k)
function log(a::Real, b::Real, eps::Real)
    z, t, y = x, 1, 0
    while z > a || z < 1/a || t > eps   
        if z > a
            z /= a
            y += t 
        elseif z < 1/a
            z *= a
            y -= t # т.к. z^t = (z*a)^t * a^-t
        else # t > ε
            t /= 2
            z *= z # т.к. z^t = (z*z)^(t/2)
        end
    end
end
using .Vector2Ds
randpoints(random::Function, num::Integer) = [(random(),random()) for _ in 1:num]

points = randpoints(randn, 5)
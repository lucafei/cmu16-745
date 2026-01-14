function pendulum_backward_euler(fun, x0, Tf, dt)
    t = Array(range(0, Tf, step=dt))
    x_hist = zeros(length(x0), length(t))
    x_hist[:, 1] .= x0
    for k = 1:(length(t)-1)
        e = 1
        x_hist[:, k+1] = x_hist[:, k] #设定初值
        while e > 1e-8              #迭代收敛
            xn = x_hist[:, k] + dt .* fun(x_hist[:, k+1])   #更新方式
            e = norm(xn - x_hist[:, k+1])    #判断收敛
            x_hist[:, k+1] .= xn
        end
    end
    return x_hist, t
end

A = rand(1000, 1000)
B = rand(1000, 1000)
result = A * B
println(result)


- be careful when discretizing ODEs
- don't use forward euler integrator


a better explicit integrator
- 4th order Runge-Kutta method (industry standard)

intuition
---
- euler fits a line segment over each time step
- RK fits a cubic polynomial over each time step -> much better accuracy

pseudo code

x_n+1 = x_n + h*f(x_n)

k1 = f(x_n)
k2 = f(x_n + h/2*k1)
k3 = f(x_n + h/2*k2)
k4 = f(x_n + h*k3)

x_n+1 = x_n + h/6*(k1 + 2*k2 + 2*k3 + k4)


accuracy win -> additional compute cost

implicit form

f_d(x_n+1, x_n, u_n)=0


simplest version

backward euler

x_n+1 = x_n + h*f(x_n+1)

rewrite as:
f_d(x_n+1, x_n, u_n) = x_n + h*f(x_n+1) - x_n+1 = 0
solve root-finding problem for x_n+1
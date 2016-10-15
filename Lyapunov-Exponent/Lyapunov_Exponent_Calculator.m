function [ lambda ] = lyapunov_ex_10_13_16( x0, r )
%Calculates the Lyapunov exponent for the equation:
%           x(t + 1) = r * x(t) * (1 - x(t))
%given the inital x value and the r parameter.
temp = x0;  %temp will store x (t - 1)
x = [];     %stores all x values for t = [1, 900]

for i = 1: 900
    xt = r * temp * (1 - temp);  %xt stores x(t)
    x = [x, xt];  %appends x(t) to array of x values
    temp = xt;  %updates next value for x (t - 1)
end

%x gives us all the x values we need
%Calculate sum (k = [401, 900]) (ln (abs( fprime(xk, r)))
%fprime is r - 2 * r * x(t)
sum = 0;
for i = 401:900
    fprime = r - 2 * r * x(i);
    added = log(abs(fprime));
    sum = sum + added;
end
lambda = sum / 500;


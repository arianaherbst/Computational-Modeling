function [  ] = graph_lyapunov(  )
%Graphs the lyapunov exponent, lambda(x0, r), 
%for r = [0,4].


r = 0:.01: 4;

lambda = [];
%disp(size(r))
[z, s ]= size(r)
for i = 1 : s
    lyapex = lyapunov_ex_10_13_16( .5, r(1, i));
    lambda = [lambda, lyapex];
end
plot(r, lambda);
title('Lyapunov Exponent by r value');
xlabel('r');
ylabel('lambda ( x0, r)');


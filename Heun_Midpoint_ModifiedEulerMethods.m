%Ariana Herbst
%11/10/16
%Approximating the solution of the following initial-value problem using the
% Modified Euler, Midpoint, and Heun method, then comparing the results to 
% the actual values:
% dy/dt = (y/t) -  (y/t)^2
% 1 <= t <= 2
% y(1) = 1
% h = 0.1
% Actual solution is given by y(t) = t / (1 + ln(t)).

y0 = 1;
h = 0.1;
T = 1:.1:2;
N = 10;

% Actual solution
yt = @(t) t / (1 + log(t));
y = [];
for t = 1:.1:2
    y = [y yt(t)];    
end

ft = @(t, w) (w / t) - (w / t) ^ 2;

% Modified Euler
modEulError = 0;
modEul = [y0];
for i = 0:(N - 1)
    ti = 1 + h*i;
    wi = modEul(i + 1);
    f = ft(t, wi);
    next = wi + h * ((f + ft(ti + h, wi + h * f))/2);
    modEul = [modEul next];
    modEulError = modEulError + abs(modEul(i + 1) - y(i + 1));
end


% Midpoint Method
midpoint = [y0];
midpointError = 0;
for i = 0:(N - 1)
    wi = midpoint(i + 1);
    ti = 1 + h*i;
    next = wi + h * ft (ti + h/2, wi + ( h / 2) * ft(ti, wi)); %Calculate w(i + 1)
    midpoint = [midpoint next];
    midpointError =  midpointError + abs(midpoint(i + 1) - y(i + 1));
end

% Heun's Method
heun = [y0];
heunError = 0;
for i = 0:(N - 1)
    wi = heun(i + 1);
    ti = 1 + h * i;
    next = wi + (h / 4) *( ft(ti, wi) + 3 * ft(ti + 2 * h / 3, wi + (2 * h / 3 ) * ft (ti + h / 3, wi + h / 3 * ft(ti, wi))));
    heun = [heun next];
    heunError = heunError + abs(heun(i + 1) - y(i + 1));
end
figure;
hold on;
xlabel = ('t');
ylabel = ('y(t)');
plot (T, y, 'DisplayName', 'y(t)');
plot (T, modEul, 'DisplayName', 'Modified Euler');
plot (T, midpoint, 'DisplayName', 'Midpoint');
plot (T, heun, 'DisplayName', 'Heun');
legend('show');
title('Graph of Varioius Numerical Estimations for y(t) = t / (1 + ln(t))');

disp(sprintf('Modified Euler Method Error: %d', modEulError));
disp(sprintf('Midpoint Method Error: %d', midpointError));
disp(sprintf('Heun Method Error: %d', heunError));




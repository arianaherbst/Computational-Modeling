function [ v, lambda ] = powerMethod( A )
%Power method: for determining eigenpair with eigenvalue of largest absolute
%value
%very small tolerance.
tolerance = .00000000001;
dims = size(A);
%create a v(0) with same number of rows as columns of A
vk = ones(dims(2), 1);
converged = 0;  %boolean value
k = 0;
lambdaprev = 0;
while (converged ~= 1)  %while not converged
    v = A * vk;
    
    %find length
    length = sqrt(v' * v); % takes square root of dot product to find length
    
    %normalize
    v = v / length;       
    k = k + 1;
    lambda = v' * A * v;
    
    %check convergence
    if (abs(lambda - lambdaprev) < tolerance)
        converged = 1;
    end
    
    %update "previous" values
    lambdaprev = lambda;
    vk = v;     % vk is the previous iteration's value of v.
end


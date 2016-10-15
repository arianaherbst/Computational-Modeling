function [ Vk, lambda ] = QRAlgorithm( A )
%Calculates all eigenvalues and eigenvectors of a matrix A
%   input:  Matrix A to process
%   output: Matrix of eigenvectors, Vk
%           Vector of eigenvalues, lambda
%   Written 9/27/16 by Ariana Herbst
n = size(A)     % n is the size of A
V = eye(n(1));  %V is the initial value of Vk
k = 0;
diff = ones(n(1));  %the initial value of diff is set 
                    %so that it will not converge immediately.
while (sqrt(diff' * diff) > .000000001) %checks magnitude of the difference vector
    [Q, R] = qr(A);     %Householder method
    Ak = R * Q;         %Ak here is A(k + 1)
    Vk = V * Q;         %Vk here is V(k + 1)
    
    %update values
    lambdaprev = diag(A)
    A = Ak;
    V = Vk;
    k = k + 1;
    lambda = diag(Ak);
    diff = lambda - lambdaprev;  %the difference between the old and new 
                                 %lambda values will be used to check
                                 %convergence.
end



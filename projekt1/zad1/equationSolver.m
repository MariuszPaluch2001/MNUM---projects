function [x] = equationSolver(A, b, n)
[L, U, P] = partialPivoting(A, n);
y = zeros(n, 1);
b2 = P*b;
for k=1:n
    y(k) = (b2(k) - L(k, 1:k-1)*y(1:k-1)) / L(k,k);
end
x = zeros(n,1);
for k=n:-1:1
    x(k) = (y(k) - U(k, k+1:n) * x(k+1:n)) / U(k,k);
end
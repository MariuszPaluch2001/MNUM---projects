function [A, b] = equationA(n)
A = diag(-10 * ones(n, 1));
v1 = 3.5 + (1:n-3)/n;
v2 = 3.5 + (4:n)/n;
A = A + diag(v1,  3);
A = A + diag(v2, -3);
b = 0.5 + 2.5*(1:n);
b = b';

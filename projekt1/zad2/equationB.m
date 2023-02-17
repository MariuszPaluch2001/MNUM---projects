function [A, b] = equationB(n)
A = zeros(n, n);
b = zeros(n, 1);
for i=1:n
    for j=1:n
        if (i == j)
            A(i,j) = 1/3;
        else
            A(i,j) = 4*(i-j) + 2;
        end
    end
    b(i) = 3.5 - 0.4*i;
end

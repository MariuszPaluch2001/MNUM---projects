function x = jacobi(A, b, n, prec)
x = zeros(n,1);
x_old = zeros(n,1);
stop = false;
while ~stop
    for i=1:n
        x(i) = ( b(i) - A(i,1:i-1) * x_old(1:i-1) - A(i,i+1:n) * x_old(i+1:n)) / A(i,i);
    end
    x_old = x;
    stop = norm(A*x_old - b) < prec;
end
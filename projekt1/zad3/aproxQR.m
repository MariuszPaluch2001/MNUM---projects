function [a] = aproxQR(x,y,n)
    A = zeros(size(x, 1),n+1);
    for i=1:n+1
            A(:,i) = x.^(i-1);
    end
    [Q,R] = qr(A);
    y_tilde = Q'*y;
    a = linsolve(R,y_tilde);
end


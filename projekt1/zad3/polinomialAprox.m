function [a] = polinomialAprox(x,y,n)
G = zeros(n+1,n+1);
r = zeros(n+1,1);
for k = 0:n
    for i = 0:n
        G(k+1,i+1) = sum(x.^(k+i));
    end
    r(k+1) = sum(y'*(x.^(k)));
end
    a = G^(-1)* r;
end


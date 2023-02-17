function [k] = calc_k(x, t, h, f)
    a = [0 0 0;
         1/2 0 0; 
         -1 2 0];
    
    c = [0 1/2 1]';

    k = zeros(3, length(x));
    
    k(1, : ) = f(t, x);
    k(2, : ) = f(t*c(2)*h, x + h*a(2, 1)*k(1, :));
    k(3, : ) = f(t*c(3)*h, x + h*a(3, 1:2)*k(1:2, :));
end
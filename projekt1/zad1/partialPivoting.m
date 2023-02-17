function [L,U,P] = partialPivoting(A, n)
L = zeros(n,n);
U = A;
P = diag(ones(n,1));
for k=1:n-1
    [~,i] = max(abs(U(k:n,k)));
    if (i ~= 1)
        max_idx = i+k-1;
        P_temp = diag(ones(n,1));
        P_temp(sub2ind(size(P_temp),[max_idx k],[k max_idx])) = 1;
        P_temp(sub2ind(size(P_temp),[max_idx k],[max_idx k])) = 0;
        L = P_temp*L;
        U = P_temp*U;
        P = P_temp*P;
    end
    L(k+1 : n, k) = U(k+1 : n, k) / U(k,k);
    U(k+1:n, : ) = U(k+1:n, : ) - L(k+1 : n, k) * U(k, :);
end
L = L + diag(ones(n,1));
end
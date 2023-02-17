function [q] = polyReduce(a, alpha)

n = length(a);
k = floor(n/2);

asc_a = flip(a);

q = zeros(n, 1);
q(1) = 0;
q(n) = a(n);

for i=n-1:-1:k+1
    q(i) = asc_a(i) + q(i+1)*alpha;
end

for i=1:n
    q(i + 1) = (q(i) - asc_a(i)) / alpha;
end

q = flip(q(2:n));
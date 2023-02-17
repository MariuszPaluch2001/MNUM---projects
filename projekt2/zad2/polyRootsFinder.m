function [xs, ys, iexes, texes] = polyRootsFinder(a, x_start, delta, max_iters)

n = length(a) - 1;
xs = zeros(n, 1);
ys = zeros(n, 1);
iexes = zeros(n,1);
texes = zeros(n, 1);
for i=1:n
    [x, y, iexe, texe] = Laguerr(a, x_start, delta, max_iters);
    xs(i) = x;
    ys(i) = y;
    texes(i) = texe;
    iexes(i) = iexe;
    a = polyReduce(a, x);
end
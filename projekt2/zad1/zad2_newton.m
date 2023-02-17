x0 = 2;
numb_roots = 2;
delta = 1e-8;
epsilon = 0.5;
f = @(x) 1.5*sin(x) + 2*log(x+2.5) - 5;
newton_adapter = @(func,a,b,delta,imax) (newton(func,a,delta,imax));

[x, y, iexes, texes, xs0, ~] = rootsFinder(f, newton_adapter, x0, 12, numb_roots, 1e-8, 10000, 0.5);

for i=1:numb_roots
    fprintf("x=%4.2f x0=%4.2f\n",x(i), xs0(i));
    fprintf("x=%4.2f y=%10.9f iters=%d exec_time=%8.6fs\n",x(i),y(i), iexes(i), texes(i));
end

fplot(@(x) f(x), [2 12]);
hold on;
plot(x, y, "r*");
title('Newton method');
xlabel('x');
ylabel('f(x)');
grid on;
hold off;
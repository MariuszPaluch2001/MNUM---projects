start_x = 2; end_x = 12;
numb_roots = 2;
delta = 1e-8;
epsilon = 0.5;
f = @(x) 1.5*sin(x) + 2*log(x+2.5) - 5;

[xs, ys, iexes, texes, starts, ends] = rootsFinder(f, @falsePosition, start_x, end_x, numb_roots, delta, 10000, epsilon);

for i=1:numb_roots
    fprintf("x=%4.2f start=%4.2f end=%4.2f\n",xs(i), starts(i), ends(i));
    fprintf("y=%10.9f iters=%d exec_time=%8.6fs\n",ys(i),iexes(i),texes(i));
    
end

fplot(@(x) f(x), [2 12]);
hold on;
plot(xs, ys, "r*");
xlabel('x');
ylabel('f(x)');
title('False position metod')
grid on;
hold off;
a = [-2 3 3 1 2]';
n = length(a) - 1;
x = linspace(-2, 3, 10000);
[xf,ff,iexe,texe] = polyRootsFinder(a, 1, 1e-8, 1000);
for i=1:n
    fprintf("Miejsca zerowe: %3.2f %5.3fi, błąd aproksymacji: %11.10f, liczba iteracji %d: czas obliczeń: %7.5fs\n", ...
        real(xf(i)), imag(xf(i)),ff(i),iexe(i), texe(i))
end

hold on;
xf = real(xf(abs(imag(xf)) < 1e-5));
ff = polyval(a, xf);
plot(x, polyval(a,x));
plot(xf, ff,'r*');
xlabel('x');
ylabel('y(x)');
grid on;
hold off;

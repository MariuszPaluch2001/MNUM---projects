n_list = [5, 10, 25, 50, 100, 200];
epsA = zeros(6, 1);
epsB = zeros(6, 1);
prec = 1e-8;
for i=1:6
    n = n_list(i);
    [A,b] = equationA(n);
    tStart = tic;
    x = jacobi(A, b, n, prec);
    tEnd = toc(tStart);
    fprintf("Obliczenia dla macierzy A o rozmiarze %d: %7.5f\n", n, tEnd);
    epsA(i) = norm(A * x - b);

end
title("Wykres błędu dla metody Jacobbiego");
xlabel("Wymiarowość");
ylabel("Epsilon");
hold on
plot(n_list, epsA');
hold off
legend("Układ równań A")
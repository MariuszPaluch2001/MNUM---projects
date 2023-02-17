n_list = [5, 10, 25, 50, 100, 200];
eps_A = zeros(6, 1);
eps_B = zeros(6, 1);
for i=1:6
    n = n_list(i);
    [A,b] = equationA(n);
    tStart = tic;
    x = equationSolver(A, b, n);
    fprintf("Obliczenia dla macierzy A o rozmiarze %d: %7.5f\n", n, toc(tStart));
    eps_A(i) = norm(A * x - b);

    [A,b] = equationB(n);
    tStart = tic;
    x = equationSolver(A, b, n);
    tEnd = toc(tStart);
    %fprintf("Obliczenia dla macierzy B o rozmiarze %d: %7.3f\n", n, tEnd);
    eps_B(i) = norm(A * x - b);
end
title("Wykres błędu dla alg. częściowego wyboru");
xlabel("Wymiarowość");
ylabel("Epsilon");
hold on
plot(n_list, eps_A');
plot(n_list, eps_B');
hold off
legend("Układ równań A", "Układ równań B")
x = linspace(-10,10,11)';
poly_x = linspace(-10,10,110)';
poly_y = zeros(5, 110);
y = [
    -32.959;
    -20.701;
    -12.698;
    -5.150;
    -1.689;
     0.126;
     0.074;
    -0.870;
    -1.737;
    -3.995;
    -4.898;
];

dims = [3 5 7 9 10];
for i = 1:5
    coef = polinomialAprox(x,y, dims(i));
    poly_y(i, :) = polyval(coef(end:-1:1), poly_x)';
    fprintf("Norma 2 dla wielomianu o wymiarze %d: %15.14f\n", dims(i), norm(y - polyval(coef(end:-1:1), x)));
    fprintf("Norma inf dla wielomianu o wymiarze %d: %15.14f\n", dims(i), norm(y - polyval(coef(end:-1:1), x), "inf"));
end

hold on
scatter(x,y)
title("Aproksymacja funkcji z wykorzystaniem równań normalnych");
xlabel("x");
ylabel("y");
for i=1:5
    plot(poly_x, poly_y(i,:), 'DisplayName', "Wymiar: " + dims(i));
end
legend('Location', 'southeast');
hold off
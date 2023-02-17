der_x1 = @(x) (x(2) + x(1)*(0.4 - x(1)^2 - x(2)^2));
der_x2 = @(x) (-x(1) + x(2)*(0.4 - x(1)^2 - x(2)^2));

der = @(t,x) ([der_x1(x), der_x2(x)]);

der("dupa", [10.0, 10.0])
[x1, t1, h, delta, speed] = rk3([10.0, 10.0], 1e-4, 0, 20, der, 1e-3, 1e-3, 1e-9);

[t2, x2] = ode45(@(t,x) (der(t,x)'),[0 20], [10.0, 10.0]);

fprintf("Liczba kroków RK3: %d\n", length(t1));
fprintf("Liczba kroków ODE45: %d\n", length(t2));

semilogy(speed)
title("Wykres prędkości od numeru kroku w skali logarytmicznej.")
input("Następny","s")

t1(1:30)
semilogy(t1,speed);
hold on;
title("Wykres prędkości od czasu w skali log.")
hold off;
input("Następny","s")
plot3(x1(:, 1), x1(:,2), t1)

input("Następny","s")

x = zeros(length(delta), 1);
for i=1:length(delta)
    x(i) = norm(delta(i), inf);
end

plot(x);
input("Następny","s")
plot(norm(delta));
hold on;
title("Błąd od czasu");
xlabel("czas");
ylabel("Błąd");
hold off;


plot(x1(:, 1), x1(:, 2));
hold on
plot(x2(:, 1), x2(:, 2));
title("Przestrzeń fazowa");
legend("rk3", "ode45");
xlabel("x1");
ylabel("x2");
hold off

input("Następny","s")
plot(t1, x1(:, 1));
hold on;
plot(t2, x2(:, 1));
title("x1(t)");
legend("rk3", "ode45");
xlabel("Czas");
ylabel("x1");
hold off;

input("Następny","s")
plot(t1, x1(:, 2));
hold on;
plot(t2, x2(:, 2));
title("x2(t)");
legend("rk3", "ode45");
xlabel("Czas");
ylabel("x2");
hold off;

input("Następny","s")
plot(t1, h);
hold on;
title("Krok od czasu");
xlabel("Czas");
ylabel("Długość kroku");
hold off;

input("Następny","s")
plot(t1, delta);
hold on;
title("Błąd od czasu");
xlabel("czas");
ylabel("Błąd");
hold off;


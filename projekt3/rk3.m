function [x, t, h, delta, speed] = rk3(x_start, h_start, t_start, t_end, f, w_epsilon, b_epsilon, h_min)

w = [1/6 2/3 1/6];

x = zeros(1, length(x_start));
delta = zeros(1, length(x_start));
x(1, : ) = x_start;
h(1) = h_start;
t(1) = t_start;
s = 0.9;
beta = 5;
i = 1;

while t(i) < t_end
    i = i + 1;
    t(i) = t(i-1) + h(i-1);
    x(i, :) =  x(i-1, :) + h(i-1)*w*calc_k(x(i-1,:), t(i-1), h(i-1), f);
    %idk = f(t(i-1), x(i-1, :))
    speed(i - 1) = norm(f(t(i-1), x(i-1, :)));
    if i > 2 && mod(i, 2)
        x2 = x(i-2, :) + 2*h(i-2)*w*calc_k(x(i-2,:), t(i-2), 2*h(i-2), f);
        delta(i, :) = (x(i, :) - x2) / 7;
        eps = abs(x(i, :)) * w_epsilon + b_epsilon;
        alfa = min((eps./abs(delta(i, :))).^(1/4));
        h_next = s*h(i-1)*alfa;
        if h_next < h_min
            fprintf("Niemożliwe rozwiązanie z zadaną dokładnością");
            return
        end
        h(i) =  min( [h_next, beta*h(i - 1), t_end - t(i - 1)] );
    else
        h(i) = h(i-1);
        delta(i, :) = delta(i - 1, :);
    end
end
speed(i) = norm(f(t(i), x(i, :)));
end
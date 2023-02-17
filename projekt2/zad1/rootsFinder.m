function [xs,ys,iexes,texes, starts, ends] = rootsFinder(f, root_method, ...
            x_start, x_end, roots_numb, delta, imax, epsilon)

xs = zeros(roots_numb, 1) + x_start - 1;
ys = zeros(roots_numb, 1);
starts = zeros(roots_numb, 1);
ends = zeros(roots_numb, 1);
iexes = zeros(roots_numb, 1);
texes = zeros(roots_numb, 1);
i = 1;
for a=x_start:epsilon:x_end
    for b=x_end:-epsilon:a
        if i > roots_numb
            break
        end
        [x,y,iexe,texe] = root_method(f, a, b, delta, imax);
        if abs(y) < delta && x <= x_end && x >= x_start && min(abs(xs - x)) > 1e-4
            xs(i) = x;
            ys(i) = y;
            starts(i) = a;
            ends(i) = b;
            iexes(i) = iexe;
            texes(i) = texe;
            i = i + 1;
        end
    end
end
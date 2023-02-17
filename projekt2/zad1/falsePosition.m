function [xf, ff, iexe, texe] = falsePosition(f, a_start, b_start, delta, imax)
%
%   CEL
%       Poszukiwanie pierwiastka funkcji jednej zmiennej
%       metoda regula falsi
%
%   PARAMETRY WEJSCIOWE
%       f       -  funkcja dana jako wyrazenie  
%       a_start -  wstępny początek przedziału
%       b_start -  wstępny koniec przedziału
%       delta   -  dokladnosc  
%       imax    -  maksymalna liczba iteracji
%
%   PARAMETRY WYJSCIOWE
%       xf     -  rozwiazanie 
%       ff     -  wartosc funkcji w xf
%       iexe   -  liczba iteracji wykonanych
%       texe   -  czas obliczen [s]
%
%   PRZYKLADOWE WYWOLANIE
%       >> [xf, ff, iexe, texe] = falsePosition(@ (x) sin(x), 2, 12, 1e-8, 100)

tic;
a = a_start; b = b_start; c = b_start;
fc = f(c);
i = 0;
while abs(fc) > delta && i < imax
     %kod do wizualizacji działania algorytmu
%      test = [a b];
%      fplot(@(x) f(x), [2 12]);
%      hold on
%      grid on;
%      plot(test, arrayfun(f, test));
%      plot(test, arrayfun(f, test), '*');
%      input(i + ". next", 's')
%      hold off
%      clf;
     i = i + 1;
     fa = f(a); fb = f(b);
     c = (a*fb - b*fa) / (fb - fa);
     if c > b_start || c < a_start
         c = (a + b) / 2;
     end
     fc = f(c);
     if fc*fb > 0
        b = c;
     else
        a = c;
     end
end
texe=toc; iexe=i;
xf=c; ff = fc;
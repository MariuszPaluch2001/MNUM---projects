function [xk, y, iexe, texe] = Laguerr(a, x_start, delta, imax)
%
%   CEL
%       Poszukiwanie pierwiastka wielomianu
%       metoda Laguerre'a
%
%   PARAMETRY WEJSCIOWE
%       a       -  współczynniki wielomianu  
%       x_start -  początkowy punkt przeszukiwań
%       delta   -  dokladnosc  
%       imax    -  maksymalna liczba iteracji
%
%   PARAMETRY WYJSCIOWE
%       xk     -  rozwiazanie 
%       y      -  wartosc funkcji w xk
%       iexe   -  liczba iteracji wykonanych
%       texe   -  czas obliczen [s]
%
%   PRZYKLADOWE WYWOLANIE
%       >> [xk, y, iexe, texe] = Laguerr([1,2,3,4]', 2, 1e-8, 100)

n = length(a);
xk = x_start;
der_a = polyder(a);
derSec_a = polyder(der_a);
f = @(x) (polyval(a,x));
df = @(x) (polyval(der_a,x));
dfSec = @(x) (polyval(derSec_a, x));
i = 0;
start = tic;
while abs(f(xk)) > delta && i < imax
    y = f(xk);
    derx = df(xk);
    derSecx = dfSec(xk);
    downPart = sqrt((n - 1)*((n-1)*(derx)^2) - n*y*derSecx);
    if abs(derx - downPart) > abs(derx + downPart)
        xk = xk - ((n*y) / (derx - downPart));
    else
        xk = xk - ((n*y) / (derx + downPart));
    end
    i = i + 1;
end
iexe = i;
texe = toc(start);
y = f(xk);
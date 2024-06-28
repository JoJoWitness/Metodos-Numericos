function [x, y, w] = EDPEliptica(f, a, b, c, d, n, m, f1, f2, f3, f4)
    hx = (b-a)/n;
    hy = (d-c)/m;
    x = a:hx:b;
    y = c:hy:d;
    w = zeros(m+1, n+1);
    
    % Aplicar condiciones de frontera
    w(1,:) = f1(x); % Frontera inferior
    w(end,:) = f2(x); % Frontera superior
    w(:,1) = f3(y); % Frontera izquierda
    w(:,end) = f4(y); % Frontera derecha
    
    % Método de Gauss-Seidel
    for iter = 1:1000 % Número máximo de iteraciones
        w_old = w;
        for i = 2:m % Iterar sobre puntos interiores
            for j = 2:n
                w(i,j) = (f(x(j), y(i)) + (w(i+1,j) + w_old(i-1,j))/hx^2 + (w(i,j+1) + w_old(i,j-1))/hy^2) / (2/hx^2 + 2/hy^2);
            end
        end
        % Condiciones de convergencia (opcional)
        if norm(w - w_old, 'fro') < 1e-5
            break;
        end
    end
end

f= @(x,y) x*exp(1)^y;
a=0;
b=2;
c=0;
d=1;
f1= @(y) 0;
f2= @(y) 2*exp(1)^y;
f3= @(x) x;
f4= @(x) exp(1)*x;
n=2;
m=2;
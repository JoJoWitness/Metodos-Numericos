function [x, y, w] = EDPEliptica(f, a, b, c, d, n, m, f1, f2, f3, f4)
  % Paso de la malla en cada dirección
  hx = (b - a) / n;
  hy = (d - c) / m;

  % Creación de vectores de coordenadas x e y
  x = a:hx:b;
  y = c:hy:d;

  % Inicialización de la solución w con ceros
  w = zeros(n+1, m+1);

  % Aplicación de las condiciones de frontera
  w(1, :) = f1(y); % Lado izquierdo
  w(end, :) = f2(y); % Lado derecho
  w(:, 1) = f3(x)'; % Lado inferior
  w(:, end) = f4(x)'; % Lado superior

  % Preparación del método iterativo de Gauss-Seidel
  iterMax = 10000; % Número máximo de iteraciones
  tol = 1e-5; % Tolerancia para la convergencia

  for iter = 1:iterMax
      w_old = w; % Guardar el estado anterior para la convergencia

      % Actualización de la solución interna mediante Gauss-Seidel
      for i = 2:n
          for j = 2:m
              w(i, j) = ((w(i+1, j) + w_old(i-1, j)) / hx^2 + ...
                         (w(i, j+1) + w_old(i, j-1)) / hy^2 - ...
                         f(x(i), y(j))) / (2/hx^2 + 2/hy^2);
          end
      end

      % Verificación de la convergencia
      if max(max(abs(w - w_old))) < tol
          break;
      end
  end

  if iter == iterMax
      warning('La solución no convergió en %d iteraciones.', iterMax);
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
function [xi, w] = disparolineal(f, a, b, alpha, beta, h)
  % Calcular N, el número de puntos en la red
  N = (b - a) / h;
  xi = a:h:b; % Vector de puntos de red
  
  % Inicializar vectores para dos suposiciones iniciales de y'(a)
  w1 = zeros(1, N+1); w1(1) = alpha;
  w2 = zeros(1, N+1); w2(1) = alpha;
  
  % Suposiciones iniciales para y'(a)
  s1 = 0; s2 = 1;
  
  % Resolver dos problemas de valor inicial con suposiciones s1 y s2
  for i = 1:N
      w1(i+1) = w1(i) + h * f(xi(i), w1(i), s1);
      w2(i+1) = w2(i) + h * f(xi(i), w2(i), s2);
  end
  
  % Aplicar el método del disparo lineal para ajustar y'(a)
  s = s1 + (s2 - s1) * (beta - w1(end)) / (w2(end) - w1(end));
  
  % Resolver el problema de valor inicial con la nueva suposición de y'(a)
  w = zeros(1, N+1); w(1) = alpha;
  for i = 1:N
      w(i+1) = w(i) + h * f(xi(i), w(i), s);
  end
end

f = @(x, w) [w(2); 4*w(1) - 4*x];
f(0,[1;0]);
a=0;
b=1;
alpha=1;
beta=2;
h=1/3;

[xi, w] = disparolineal(f, a, b, alpha, beta, h)

display(xi);
display(w);

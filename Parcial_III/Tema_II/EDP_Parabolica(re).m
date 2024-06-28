function [x, wt] = FiniteDifference(fx,F,l,T,alpha,n,m)

    % h=l/m;
    % k= T/n;
    h=0.5;
    k=0.05;
    lambda=(alpha^2*k)/h^2;
    
    x=0:h:l;
    d=1+2*lambda;

    A=diag(d*ones(m-1,1));
    A=A+diag(-lambda*ones(m-2,1),1)+diag(-lambda*ones(m-2,1),-1);

    w0=fx(x(n:m));
    % w1=A.*w0;
    % w2=A.*w1;

    w(:,1) =w0;
    % Fx = F(x(2:m)) * k; 

    for j=1:n
        w(:,j+1) = A\w(:,j);
    end

    wt=w';

end
% Función inicial 
fx = @(x) sin((pi/2) .* x) ;
F = @(x) 0;

% Parámetros de la malla
m = 4;
T = 0.1;
n = 2;
l = 2;
alpha = 1;  % Coeficiente de la ecuación de calor

% Llamada a la función
[x, w] = FiniteDifference(fx, F, l, T, alpha, n, m);


disp('x =');
disp(x);

disp('w =');
disp(w);


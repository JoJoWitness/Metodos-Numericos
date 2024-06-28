
a=1;
b=2;
alfa=1/4;
beta=1/5;
h=0.25;
tol = 0.0001;



% Valor inicial
t_0 = (beta - alfa) / (b - a);

% N�mero de pasos
n = (b - a) / h;

% Resuelve con RK4
[x, y1, ~] = RK4(a, alfa, t_0, n, h);

% Iteraci�n para el m�todo de disparo no lineal
y_f1 = y1(end);
t_1 = 2 * (beta - alfa) / (b - a);
y_f2 = 0; % Inicializaci�n
dif = 1e03;
cont = 0;

while (abs(dif) > tol)
    cont = cont + 1;
    t_2 = t_1 - (y_f2 - beta) * (t_1 - t_0) / (y_f2 - y_f1);
    [~, y1, ~] = RK4(a, alfa, t_2, n, h);
    y1_new = y1(end);
    dif = y1_new - beta;
    t_0 = t_1;
    t_1 = t_2;
    y_f1 = y_f2;
    y_f2 = y1(end);
end

% Imprime resultados
fprintf('     t       y\n');
for k = 1:length(x)
    fprintf('%6.2f     %12.8f\n', x(k), y1(k));
end

% Funci�n RK4
function [x, y1, y2] = RK4(x0, y10, y20, n, h)
    f1 = @(x, y1, y2) y2;
    f2 = @(x, y1, y2) 2 * y1^3;
    x = zeros(1, n + 1);
    y1 = zeros(1, n + 1);
    y2 = zeros(1, n + 1);
    x(1) = x0;
    y1(1) = y10;
    y2(1) = y20;

    for i = 1:n
        k11 = f1(x(i), y1(i), y2(i));
        k12 = f2(x(i), y1(i), y2(i));

        k21 = f1(x(i) + h/2, y1(i) + k11*h/2, y2(i) + k12*h/2);
        k22 = f2(x(i) + h/2, y1(i) + k11*h/2, y2(i) + k12*h/2);

        k31 = f1(x(i) + h/2, y1(i) + k21*h/2, y2(i) + k22*h/2);
        k32 = f2(x(i) + h/2, y1(i) + k21*h/2, y2(i) + k22*h/2);

        k41 = f1(x(i) + h, y1(i) + k31*h, y2(i) + k32*h);
        k42 = f2(x(i) + h, y1(i) + k31*h, y2(i) + k32*h);

        y1(i+1) = y1(i) + (k11 + 2*k21 + 2*k31 + k41) * h / 6;
        y2(i+1) = y2(i) + (k12 + 2*k22 + 2*k32 + k42) * h / 6;
        x(i+1) = x(i) + h;
    end
end


% Definición de la función que representa la ecuación diferencial
dydt = @(t, y) -5*y + 5*t^2 + 2*t;

% Intervalo de tiempo y condición inicial
tspan = [0 1];
y0 = 1;

% Uso de ode45 para resolver la ecuación diferencial
[t, y] = ode45(dydt, tspan, y0);

% Búsqueda de la aproximación de y(0.25)
% Podemos usar interp1 porque ode45 puede no devolver el valor exactamente en t=0.25
y_at_025 = interp1(t, y, 0.25);

% Mostrar el resultado
disp(['La aproximación de y(0.25) es: ', num2str(y_at_025)]);% Definición de la función que representa la ecuación diferencial
dydt = @(t, y) -5*y + 5*t^2 + 2*t;

% Intervalo de tiempo y condición inicial
tspan = [0 1];
y0 = 1;

% Uso de ode45 para resolver la ecuación diferencial
[t, y] = ode45(dydt, tspan, y0);

% Búsqueda de la aproximación de y(0.25)
% Podemos usar interp1 porque ode45 puede no devolver el valor exactamente en t=0.25
y_at_025 = interp1(t, y, 0.25);

% Mostrar el resultado
disp(['La aproximación de y(0.25) es: ', num2str(y_at_025)]);% Definición de la función que representa la ecuación diferencial
dydt = @(t, y) -5*y + 5*t^2 + 2*t;

% Intervalo de tiempo y condición inicial
tspan = [0 1];
y0 = 1;

% Uso de ode45 para resolver la ecuación diferencial
[t, y] = ode45(dydt, tspan, y0);

% Búsqueda de la aproximación de y(0.25)
% Podemos usar interp1 porque ode45 puede no devolver el valor exactamente en t=0.25
y_at_025 = interp1(t, y, 0.25);

% Mostrar el resultado
disp(['La aproximación de y(0.25) es: ', num2str(y_at_025)]);
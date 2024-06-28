% Metodo de Euler
h = 0.001;
a = 0;
b=2;
t = a:h:b; %puntos de red 
%definir funcion f y la condicion inicial alpha
f=@(t,y) y-t^2 + 1;
alpha = 0.5;
% implementar el metodo
N = length(t);
w = zeros(1,N);
w(1)=alpha;
for i=1:N-1
    w(i+1)= w(i) + h*f(t(i),w(i));
end
% graficar la solucion
plot(t,w,'.-')
xlabel('t')
ylabel('w(t)')

%crear tabla de datos
T1 = table(t',w','VariableNames',{'t','w'})
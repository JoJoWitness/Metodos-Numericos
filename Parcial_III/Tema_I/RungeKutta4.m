1

function [t,w] = RungeKutta4(f,a,b,alpha,h)
 
  N = (b-a)/h;
  t = a:h:b;
  w = zeros(1,N);
  w(1)=alpha;
  
  for i=1:N-1
    k1 = f(t(i),w(i));
    k2 = f(t(i)+h/2,w(i)+(h/2)*k1);
    k3 = f(t(i)+h/2,w(i)+(h/2)*k2);
    k4 = f(t(i)+h,w(i)+h*k3);
    w(i+1)= w(i) + (h/6)*(k1+2*k2+2*k3+k4);
  end
end

f= @(t,y) y-t.^2+1;
a=0;
b=2;
alpha=0.5;
h=0.2;

[t,w] = RungeKutta4(f,a,b,alpha,h)



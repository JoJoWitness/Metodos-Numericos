function [t,w] = eulerPuntoMedio(f,a,b,alpha,h)

  t = a:h:b
  N = length(t);
  w = zeros(1,N);
  w(1)=alpha;
  
  for i=1:N-1
    k1 = f(t(i),w(i));
    k2 = f(t(i)+h/2,w(i)+h/2*k1);
    k3 = f(t(i)+h/2,w(i)+h/2*k2);
    k4 = f(t(i)+h,w(i)+h*k3);
    w(i+1)= w(i) + h/6(k1+2*k2+2*k3+k4);
  end

  t =x1;
  w= y1;

ends

f= "pi*x.*(x+y)";
a=0;
b=0.5;
alpha=@(y) 0.25*y;
h=0.001

[t,w] = euler(f,a,b,alpha,h)

display(t);
display(w);




function [t,w] = eulerMejorado(f,a,b,alpha,h)

  t = a:h:b
  N = length(t);
  w = zeros(1,N);
  w(1)=alpha;
  
  for i=1:N-1
    w(i+1)= w(i) + h/2*(f(t(i),w(i))+f((i+1),w(i+2)));
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




1

function [t,w] = EulerPuntoMedio(f,a,b,alpha,h)

  N = (b-a)/h;
  t= a:h:b;
  w = zeros(1,N);
  w(1)=alpha;
  
  for i=1:N-1
    w(i+1)= w(i) + h*f((t(i)+h/2),w(i)+h/2*f(t(i),w(i)));
  end
end

f= @(t,y) y-t.^2+1;
a=0;
b=2;
alpha=0.5;
h=0.2;

[t,w] = EulerPuntoMedio(f,a,b,alpha,h)


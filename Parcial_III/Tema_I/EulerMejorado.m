1

function [t,w] = EulerMejorado(f,a,b,alpha,h)

  N = (b-a)/h;
  t= a:h:b;
  w = zeros(1,N);
  w(1)=alpha;
  
  for i=1:N-1

  %%Predictor%%
    w(i+1)= w(i) + h*(f(t(i),w(i)));

  %%Corrector%%
    w(i+1)= w(i) + h/2*(f(t(i),w(i)) + f(t(i+1),w(i+1)));
  end
end

f= @(t,y) (t-y)./2;
a=0;
b=1;
alpha=1;
h=0.2;

[t,w] = EulerMejorado(f,a,b,alpha,h)


function [I] = simpson(fx,a,b,n)

  h=(b-a)/n;
  x=a+(0:n)*h;
  f=eval(fx);
  n=length(f)-1;

  if(n==1)
    fprintf('Los datos solo tienen un intervalo');
  elseif (n==2)
    I=h/3*(f(1)+4*f(2)+f(3));
  elseif(n==3)
    I=3/8*h*(f(n-2)+3*f(n-1)+3*f(n)+f(n+1));
  end;

  I=0;

  if(2*floor(n/2)~=n)
    I=3/8*h*(f(n-2)+3*f(n-1)+3*f(n)+f(n+1));
    m=n-3;
  else
    m=n;
  end

  I=I+(h/3)*(f(1)+4*sum(f(2:2:m))+f(m+1));
  
  if(m>2)
    I= I+(h/3)*2*sum(f(3:2:m));
  end

  plot(x,f, 'g'), grid;
  plot(x, zeros(size(x)), 'b');
  grid;

  for(i=1:n)
    plot([x(i),x(i)], [0,f(i)]), grid;
  end

  h2=(b-a)/100;
  x=a+(0:100)*h2;
  f=eval(fx)
  plot(x,f, 'r'), grid;
end

fx = "1+2.*x+3.*x.^2";
a=-2;
b=4;
n=2;

[I] = simpson(fx,a,b,n);

fprintf('Aproximacion de la integral = %4.5f', I)


function [I] = trapecio(fx,a,b,n)

  h=(b-a)/n;
  x=a;
  fa=eval(fx);
  x=b;
  fb=eval(fx);
  s=0;

  for i=1:n-1
      x=a+i*h;
      f1=eval(fx);
      s=s+f1;
  end

  I=(h/2)*(fa+2*s+fb);

  c=0;

  for j1=0:n
    c=c+1;
    %xd(c)=a+h*j1;
    xd=a+h*j1;
    yd(c)=eval(fx);
  end

  x=a:h:b;
  y=eval(fx);
  plot(xd,yd,'b'),grid,title("grafica por trapecio");
  hold on
  plot(x,y,'r'),xlabel('eje x'), ylabel('eje y')
end

fx = "1+2.*x+3.*x.^2";
a=-2;
b=4;
n=40;

[I] = trapecio(fx,a,b,n);

fprintf('Aproximacion de la integral = %4.5f', I)
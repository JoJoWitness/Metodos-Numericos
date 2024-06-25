function [t,w] = euler(f,a,b,alpha,h)

  x1= zeros(1,4+1);
  y1=zeros(1,4+1);
  x1= a:h:b;
  y1(1)=alpha;
  for i=1:2;
    x=x1(1);
    y=y1(1);
    y1(i+1)=y1(i)+h*eval(f);
  
  end
     

  t =x1;
  w= y1;

end

f= "pi*x.*(x+y)";
a=0;
b=0.5;
alpha=@(y) 0.25*y;
h=0.001

[t,w] = euler(f,a,b,alpha,h)

display(t);
display(w);




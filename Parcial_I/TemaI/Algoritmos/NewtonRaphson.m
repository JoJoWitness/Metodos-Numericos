1

function [ root, iter ] = NewtonRa(f, df,x0,tol,imax)
  x = x0;
for i = 1:imax
  a = f(x);
  b = df(x);
  r =  x - a/b;
  
  if(abs(r - x) < tol)
      root = r;
      iter = i;
      break;
  end
  x=r;
end

if i == imax
 fprintf('The solution was out of the iteration bounds')
end


end


f = @(x) (exp(x)+2.^(-x)+2*cos(x)-6);
df = @(x) (exp(x)-log(2)*2.^(-x)-2*sin(x));
[root, iter] = NewtonRa(f, df,1,10^-6,30);

fprintf("The root of the function is: %d", root);



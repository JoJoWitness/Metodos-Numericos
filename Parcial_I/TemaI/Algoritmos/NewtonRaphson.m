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


f = @(x) (x.^2 - 6);
df = @(x) (2*x);

[root, iter] = NewtonRa(f, df,1,10^-4,30);

fprintf("The root of the function is: %d", root);



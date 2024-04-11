function [ root, iter ] = NewtonRaphson(x0,tol,imax)
  x = x0;
for i = 1:imax
  a = fun(x);
  b = diffFun(x);
  r =  x - a/b;
  
  if(abs(r - x) < tol)
      root = r
      iter = i
      break;
  end
  x=r;
end

if i == imax
 fprintf('The solution was out of the iteration bounds')
end


end

function f = fun(x)
f = x-exp(1)^-x;
end

function fu = diffFun(x)
fu = 1+exp(1)^-x;
end


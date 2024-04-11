function [root, iter] = Secant(a0,b0,tol,imax)
  a =a0;
  b= b0;
  
  for i = 1:imax
      temp = b - ((b-a)/(fun(b)-fun(a)))*fun(b);
      a = b;
      b = temp;
      
      if (abs(b-a) < tol)
          root = b;
          iter = i;
          break;
      end
  end

  if i == imax
      fprintf('The solution was out of the iteration bounds')
      return; 
  end
      
  root
  iter
  
end

function f = fun(x)
  f = x-exp(1)^-x;
end


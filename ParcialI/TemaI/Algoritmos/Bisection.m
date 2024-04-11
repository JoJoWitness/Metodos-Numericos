%Metodo de la bisccion

function [root, iter] = bisection(a0,b0,tol,imax)
  a = a0;
  b = b0;
  for i = 1:imax
       r = (a+b)/2;
      if (fun(a)*fun(r) < 0)
          b = r;
      elseif (fun(r)*fun(b) < 0)
          a = r;
      else
          fprint('There was a fatal error in the code or function')
      end
      
      if (abs(fun(r)) < tol) 
          root = r
          iter = i
          break
      end 
  end
  
  if i == imax
     fprintf('The solution was out of the iteration bounds ')
  end

  
end

function f = fun(x)
  f = x -exp(1)^-x;
  %f= x-25^(1/3);   
end




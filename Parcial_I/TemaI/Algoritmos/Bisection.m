1

%Metodo de la bisccion

function [root, iter] = Bisection(f,a0,b0,tol,imax)
  a = a0;
  b = b0;
  for i = 1:imax
       r = (a+b)/2;
      if (f(a)*f(r) < 0)
          b = r;
      elseif (f(r)*f(b) < 0)
          a = r;
      else
          fprintf('There was a fatal error in the code or function')
      end 
      if (abs(f(r)) < tol) 
          root = r;
          iter = i;
          break
      end 
  end
  if i == imax
     fprintf('The solution was out of the iteration bounds')
  end  
end


f = @(x) (exp(x)+2.^(-x)+2*cos(x)-6);

[root, iter] = Bisection(f,1,2,10^-6,100);

fprintf("The root is: %d\n", root);
fprintf("The iteration neccessary where: %d", iter)

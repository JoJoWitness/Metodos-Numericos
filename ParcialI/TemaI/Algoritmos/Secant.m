function [root, iter] = Secante(f, a0,b0,tol,imax)
  a =a0;
  b= b0;
  
  for i = 1:imax
      temp = b - ((b-a)/(f(b)-f(a)))*f(b);
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
  
end

  f = @(x) (x^3+3*x^2-1);
 
  [root, iter] = Secante(f, 0,1, 10^-4, 30);

  fprintf("The root is: %d\n", root);
  fprintf("The iteration neccessary where: %d", iter)
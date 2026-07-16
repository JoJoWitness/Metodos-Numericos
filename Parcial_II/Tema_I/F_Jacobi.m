function [x, k] = Jacobi(A, b, x0, tol, itmax)
  dim = size(A);
  y = zeros(dim(2),1);
  k=1;
  while k <= itmax
      for i=1:dim(2)
          s=0;
          for j=1:dim(2)
              if j~=i
                  s = s + A(i,j).*x0(j);
              end
          end
          y(i) = (b(i) - s)./A(i,i);
      end
      if norm(y-x0,inf) < tol
          x=y;
          break;
      end
      k = k + 1;
      x0 = y;
  end
  
  if k > itmax
      fprintf('El metodo no converge\n');
      fprintf('El numero de iteraciones es: %d\n', k);
  end

end

A = [10 -1 0; -1 10 -2; 0 -2 10];
b = [9;7;6];
x0 =[0;0;0];
tol = 1e-3;
itmax = 1000;

[x, k] = Jacobi(A, b, x0, tol, itmax)

fprintf('La solucion es: \n');
disp(x);
fprintf('El numero de iteraciones es: %d\n', k);

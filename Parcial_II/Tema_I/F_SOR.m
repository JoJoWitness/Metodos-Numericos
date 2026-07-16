function [x, k] = SOR(A, b, x0, tol, itmax, omega)
  dim = size(A);
  y = zeros(dim(2),1);
  k=1;
  while k <= itmax
      for i=1:dim(2)
          sum1=0;
          for j=1:i-1
            sum1 = sum1 + A(i,j).*y(j);
          end

          sum2=0;

          for j=i+1:dim(2)
            sum2 = sum2 + A(i,j).*x0(j);
          end

          y(i) = (1-omega)*x0(i)+(omega./A(i,i))*(b(i) - sum1 - sum2);

      end

      if norm(y-x0,inf) < tol
          x=y;
          break
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
omega=1.25;

[x, k] = SOR(A, b, x0, tol, itmax, omega)

fprintf('La solucion es: \n');
disp(x);
fprintf('El numero de iteraciones es: %d\n', k);

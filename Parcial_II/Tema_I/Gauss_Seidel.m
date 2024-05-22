
A = [10 -1 0; -1 10 -2; 0 -2 10];
b = [9;7;6];
x =[0;0;0];
tol = 1e-3;
it_max = 1000;

  dim = size(A);
  y = zeros(dim(2),1);
  k=1;
  band = 0;
  while k <= it_max && ~band
      for i=1:dim(2)
          sum1=0;
          for j=1:i-1
            sum1 = sum1 + A(i,j).*y(j);
          end

          sum2=0;

          for j=i+1:dim(2)
            sum2 = sum2 + A(i,j).*x(j);
          end

          y(i) = (b(i) - sum1 - sum2)./A(i,i);
      end

      if norm(y-x,inf) < tol
          band = 1;
      end
      k = k + 1;
      x = y;
  end

  if band == 1
      fprintf('La solucion es: \n');
      disp(y);
      fprintf('El numero de iteraciones es: %d\n', k);
  else
      fprintf('El metodo no converge\n');
      fprintf('El numero de iteraciones es: %d\n', k);

  end
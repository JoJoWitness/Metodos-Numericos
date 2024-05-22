function [x,L,U] = factorizarLU(matriz)
  A = matriz;
  L = zeros(size(A)-1);
  U = zeros(size(A)-1);
  n = length(L);
  
  for i = 1:n
    L(i,i) = 1;
  end
  
  U(1,1) = A(1,1);

  for j = 2:n
    L(j,1) = A(j,1)./U(1,1);
    U(1,j) = A(1,j)./L(1,1);
  end

  for i = 2:n
    acum = 0;
    for k = 1:i-1
      acum = acum + L(i,k)*U(k,i);
    end
    U(i,i) = A(i,i) - acum;
    
    for j = i+1:n
      acum2=0;
      acum3=0;
      for k = 1:i-1
        acum2 = acum2 + L(j,k).*U(k,i);
        acum3 = acum3 + L(i,k).*U(k,j);
      end
      U(i,j) = (A(i,j) - acum3)./L(i,i);
      L(j,i) = (A(j,i) - acum2)./U(i,i);
    end    
  end  
  z(1) = A(1,n+1)./L(1,1);
  
  for i = 2:n
    sum = 0;
    for j = 1:i-1
      sum = sum + L(i,j)*z(j);
    end
    z(i) = (A(i,n+1) - sum)./L(i,i);
  end
  
  x(n) = z(n)./U(n,n);
  i=n-1;
  while i>0
    sum = 0;
    for j = i+1:n
      sum = sum + U(i,j)*x(j);
    end
    x(i) = (z(i) - sum)./U(i,i);
    i = i-1;
  end
end

matriz = [1 3 5 7 1; 2 -2 3 5 2; 0 0 2 5 3; -2 -6 -3 1 4];
[x,L,U] = factorizarLU(matriz);
display(x);
display(L);
display(U);

function [x] = Cholesky(A,b)

L = chol(A,'lower');
R = L';
i=1;
[n] = size(A);
cont = 0;

  if A==A'
      fprintf('\nLa matriz es simetrica\n');
      
      while i<=n(1)
          
          M=A(1:i,1:i);
          
          if det(M) > 0
              cont = cont + 1;
          end
          
          i = i + 1;        
      end
      
      if cont==n(1)
          fprintf('\nLa matriz es positiva\n');
          y = inv(L)*b;
          x = inv(R)*y;
      end    
  end
end

A = [1 3 5 7; 2 -2 3 5; 0 0 2 5; -2 -6 -3 1];
b = [1;2;3;4];

x =Cholesky(A,b)
disp(x);
function [x] = F_Cholesky(A,b)

L = chol(A,'lower');
R = L;
i=1;
[n] = size(A);
cont = 0;

  if A==A
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
          y = L\b;
          x = R\y;
      end    
  end
end

A = [4 1 1 1; 1 3 -1 1; 1 -1 2 0; -1 1 0 2];
b = [0.65;0.05;0;0/5];

x =F_Cholesky(A,b);
disp(x);
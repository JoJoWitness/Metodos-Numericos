function [x] = solve_Gauss(A,b)
  s = length(A);
  for j = 1:(s-1)
      for i = s:-1:j+1
          m = A(i,j)/A(j,j);
          A(i,:) = A(i,:) - m*A(j,:);
          b(i) = b(i) - m*b(j);
      end
  end 
  x = zeros(s,1);
  x(s) = b(s)/A(s,s);               
  for i = s-1:-1:1                    
      sum = 0;
      for j = s:-1:i+1                
          sum = sum + A(i,j)*x(j);    
      end 
      x(i) = (b(i)- sum)/A(i,i);
  end 
end

A=[1.19 2.11 -100 1; 14.2 -0.122 12.2 -1 ; 0 100 -99.9 1 ; 15.3 0.11 -13.1 -1];
b=[1.12; 3.44; 2.15; 4.16];

[x] = solve_Gauss(A,b);
display(x)

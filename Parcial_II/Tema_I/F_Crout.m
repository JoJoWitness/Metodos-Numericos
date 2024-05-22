function [x] = Crout(A, b)

n=size(A)
L(1,1) = A(1,1);
U(1,2) = A(1,2)/L(1,1);
y(1) = b(1)/L(1,1);

for i=2:n-1;
   L(i,i-1) = A(i,i-1);
   L(i,i) = A(i,i) - (L(i,i-1)*U(i-1,i));
   U(i,i+1) = A(i,i+1)/L(i,i);
   y(i) = (b(i)-(L(i,i-1)*y(i-1)))/L(i,i);
end

L(n,n-1)=A(n,n-1);
L(n,n) = A(n,n)-(L(n,n-1)*U(n-1,n));
y(n) = (b(n)-(L(n,n-1)*y(n-1)))/L(n,n);

x(n) = y(n);
for i=1:n-1;
    x(n-i) = y(n-i)-(U(n-i,n-i+1)*x(n-i+1));
end

end

A = [1 3 5 7; 2 -2 3 5; 0 0 2 5; -2 -6 -3 1];
b = [1;2;3;4];
x = Crout(A,b);
disp(x);
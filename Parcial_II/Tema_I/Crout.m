function [L,U]=decrout(A)
[m,n]=size(A);
if m==n
L=zeros(n);
U=eye(n);
j=1;
%n;
 %for p=1:n
  %    L(p,1)=A(p,1);
 %end
 L(:,1)=A(:,1);
for k=2:(2*n-1)
  if(mod(k,2)==0)
      %k;
      f=k/2;
      %f;
      for l=f+1:n
      O=L(f,:)*U(:,l);
      U(f,l)=((A(f,l)-O)/L(f,f));
     % if(f==2 && l==3)
        %  L(f,:);
         % U(:,l);
          %O;
      %end
     %U;
     %l;
      end
  else
      fg=k-j;
     % k;
      %fg;
      %U;
      for l=fg:n
      O=L(fg,:)*U(:,l);
      L(l,fg)=A(l,fg)-O;%aqui
      L;
      end
      j=j+1;
  end
 end

end
end

function [X]=trisolve(L,U,b)
  y=L\b;
  X=U\y;
end

A = [10 5 0 0 ; 5 10 -4 0; 0 -4 8 -1;0 0 -1 5];
b =[6;25;-11;-11]

[L, U] = ecrout(A)

[X]=trisolve(L,U,b)

display(X)
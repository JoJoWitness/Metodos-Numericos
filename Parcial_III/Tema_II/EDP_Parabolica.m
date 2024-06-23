function [x, wt] = FiniteDifference(fx,l,T,alpha,n,m)

    h=l/m;
    k= T/n;
    lambda=(alpha^2*k)/h^2;
    
    x=0:h:l;
    d=1-2*lambda;

    A=diag(d*ones(m-1,1));
    A=A+diag(lambda*ones(m-2,1),1)+diag(lambda*ones(m-2,1),-1);

    w0=fx(x(n:m));
    % w1=A.*w0;
    % w2=A.*w1;

    w(:,1) =w0;

    for j=1:n
        w(:,j+1) = A*w(:,j);
    end

    wt=w';

end

fx= @(x) sin(pi*x)+x.*(1-x);
m=4;
T= 0.1;
n =2;
l=2;
alpha=1;



[x, w] = FiniteDifference(fx,l,T,alpha,n,m);
display(x);
display(w);
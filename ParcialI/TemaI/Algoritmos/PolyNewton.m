function [dd,val]=polynewton(x,y,t)
    x_length = length(x);
    dd=zeros(x_length, x_length);
    dd(:,1)=y';

    for i=2:x_length
        for j=i:x_length
            dd(j,i) = (dd(j,i-1)-dd(j-1,i-1))/(x(j)-x(j-i+1));
        end
    end

    coef=dd(x_length, x_length);

    for i=(x_length-1):-1:1
        coef=conv(coef, poly(x(i)));
        m=length(coef);
        coef(m)=coef(m)+dd(i,i);
    end

    val = polyval(coef, t);
end

% x=[50 60 70 80 90 100];
% y=[24.94 30.11 36.05 42.84 50.57 59.30];
% t=64;

x=[0*pi/2 (1*pi/2) 2*pi/2 3*pi/2 4*pi/2];
y=cos(x);
t=pi/4;

[dd, val] = polynewton(x,y,t);

%fprintf('la presion cuando la temperatura alcanza %d F, es de: %d', val, t)
fprintf('La aproximacion es de: %d', val)
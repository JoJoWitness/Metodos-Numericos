function [coef,value] = polyLagrange(x,y,t)
    x_length= length(x);
    t_length = length(t);
    dif=zeros(x_length,x_length);
    value=zeros(t_length);
    
    for k=1:x_length
        v=1; 
        for j=1:x_length
            if k ~= j
                v=conv(v, poly(x(j)))./(x(k)-x(j));
            end
        end
    dif(k,:) = v;
    end
  
    coef=y*dif;
    
    for i=1:t_length
            value(i) = polyval(coef, t(i));
    end
end

% x=[1960 1970 1980 1990 2000 2010];
% y=[179323 203302 226542 249633 281422 308746];
% t=[1950 1985 2030];

x=[0*pi/2 (1*pi/2) 2*(pi/2) 3*(pi/2) 4*(pi/2)];
y=cos(x);
t=pi/4;


[coef, value] = polyLagrange(x,y,t);

display(coef)
for i=1:length(t)
    fprintf('La aproximacion es de: %d', value)
end

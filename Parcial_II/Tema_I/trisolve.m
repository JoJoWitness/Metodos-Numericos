function [X]=trisolve(L,U,b)
y=L\b;
X=U\y;
end

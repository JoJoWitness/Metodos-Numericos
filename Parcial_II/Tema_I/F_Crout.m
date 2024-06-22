function [L, U] = tridecrout(A)

    n = size(A, 1);

    L = zeros(n, n);
    U = eye(n, n);  
    
    % Descomposición LU usando el algoritmo de Crout
    for i = 1:n
        for j = 1:i
            if j == 1
                L(i, j) = A(i, j);
            else
                L(i, j) = A(i, j) - sum(L(i, 1:j-1) .* U(1:j-1, j)');
            end
        end
        
        for j = i+1:n
            U(i, j) = (A(i, j) - sum(L(i, 1:i-1) .* U(1:i-1, j)')) / L(i, i);
        end
    end
end

function [X]=trisolve(L,U,b)
  y=L\b;
  X=U\y;
end

A = [10 5 0 0 ; 5 10 -4 0; 0 -4 8 -1;0 0 -1 5];
b =[6;25;-11;-11]

[L, U] = tridecrout(A)

[X]=trisolve(L,U,b)

display(X)
function WaveEqFiniteDifference( f, g, l, T, alpha, h, k, m, N )
    %	f y g = funciones an�nimas de las condiciones iniciales
    %   l = punto final
    %   T = tiempo m�ximo
    %   alpha = constante
    %   m y N = enteros
    %   h y k = Tama�os de paso
    
    if(h<0)         %columnas
        h = l/m;
    elseif l<0 && h>0 && m>0
        l = h*m;
    elseif m<0 && h>0 && l>0
        m = l/h;
    end
    
    if(k<0)         %filas
        k = T/N;
    elseif T<0 && k>0 && N>0
        T = k*N;
    elseif N<0 && k>0 && T>0
        N = T/k;
    end
    
    lambda = (k*sqrt(alpha)) / h;
    m = m+1; N = N+1;
    w = zeros(m,N);
    
    % for j=1:N
    %     w(0,j) = 0;
    %     w(m,j) = 0;
    % end
    
    % w00 = f(0);
    % wm0 = f(l);
    %
    % wi0 = zeros(N, 1);
    % w0j = zeros(N, 1);
    
    w(1,:) = f(0);
    w(m,:) = 0;
    %w(m,:) = f(l);
    
    j = 1;
    for i=2:m-1     %Inicializar for t=0 y t=k j==i
        w(i,1) = f(j*h);
        w(i,2) = ( (1-lambda^2)*f(j*h) )+ ( (lambda^2/2)*((f((j+1)*h) + f((j-1)*h))) ) + ( k*g(j*h) );
        j = j+1;
    end
    
    for j=2:N-1
        for i=2:m-1
            w(i, j+1) = ( 2*(1-lambda^2)*w(i, j) ) + ( lambda^2*( w(i+1, j) + w(i-1, j) ) ) - w(i, j-1);
        end
    end
    w
    fprintf('\t\tt\t\t\t  x(i)\t\t\t\tw(i,j)\n');
    for j=0:N-1
        t = j*k;
        for i=0:m-1
            x = i*h;
            %OUTPUT(x, t, w(i,j));
            fprintf(' %12.4f\t %12.4f\t  %12.4f\n', t, x, w(i+1, j+1))
        end
        disp(' ');
    end
    
    % for i=1:m-1
    %     fprintf('%12.6f\n', w(i, 1));
    % end
    
    end
    
    f= @(x) sin(pi*x);
    g = @(x) 0; 
    m=4;
    T=1;
    N =4;
    l=1;
    alpha=1;
    k= T/n;
    
    
     WaveEqFiniteDifference( f, g, l, T, alpha, h, k, m, N )
    
function [x, w] = LinearFiniteDifference(p, q, r, a, b, alpha, beta, h, N)
    %   p, q, r: funciones an�nimas
    %   a y b: puntos finales
    %   alpha y beta: condiciones de frontera
    %   h: tama�o de paso
    %   N
    
    if(N <= 0 || h <= 0)
        if(N > 0)
            h = (b-a)/(N+1);
        else
            N = ((b-a)/h) -1;
        end
    end
    
    va = zeros(1, N);
    vb = zeros(1, N);
    vc = zeros(1, N);
    vd = zeros(1, N);
    
    x = a + h;
    va(1) = 2 + (h^2 * q(x));
    vb(1) = -1 + ((h/2) * p(x));
    %vc(1) = -1 - ((h/2) * p(x));
    vd(1) = -((h^2)*r(x)) + (1 + ((h/2) * p(x)))*alpha;
    
    for i=2:N-1
        x = a + (i*h);
        va(i) = 2 + ((h^2) * q(x));
        vb(i) = -1 + ((h/2) * p(x));
        vc(i) = -1 - ((h/2) * p(x));
        vd(i) = -((h^2)*r(x));
    end
    
    x = b-h;
    va(N) = 2 + ((h^2) * q(x));
    %vb(N) = -1 + ((h/2) * p(x));
    vc(N) = -1 - ((h/2) * p(x));
    vd(N) = -((h^2)*r(x)) + (1 - ((h/2) * p(x)))*beta;
    
    l = zeros(1, N);
    u = zeros(1, N);
    z = zeros(1, N);
    
    l(1) = va(1);
    u(1) = vb(1)/va(1);
    z(1) = vd(1)/l(1);
    
    for i=2:N-1
        l(i) = va(i) - (vc(i)*u(i-1));
        u(i) = vb(i)/l(i);
        z(i) = ( vd(i) - ( vc(i)*z(i-1) ) ) / l(i);
    end
    
    l(N) = va(N) - (vc(N)*u(N-1));
    z(N) = ( vd(N) - ( vc(N)*z(N-1) ) ) / l(N);
    
    w = zeros(1, N);
    w(N) = z(N);
    
    for i = N-1:-1:1
        w(i) = z(i) - (u(i)*w(i+1));
    end
    w = [alpha, w, beta]';
    
    fprintf('Soluci�n:\n');
    fprintf('\t\t\tx \t\t\t\t\tw \n');
    
    i = 0;
    x = zeros(N+2, 1);
    for j=1:length(w)
        x(j) = a + i*h;
        fprintf('\t%12.6f \t\t%12.6f \n', x(j), w(j));
        i = i+1;
    end
    
    end
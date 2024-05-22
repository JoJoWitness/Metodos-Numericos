A = [100, 1, 0; 50, -1, 1; 25, 0, -1];
b = [519.72; 216.55; 108.27];

x =  zeros(size(b));
tolerancia = 1e-3;
max_iter = 1000;

dim = size(A);
y=x;
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

Tj = (D)\(-L-U);
ro = max(eig(Tj));
%optimal_omega= 2/(1+sqrt(1-ro^2));
band = 0;
k=1;

omega_start = 0.01;
omega_end = 1.99;
omega_step = 0.01;


optimal_omega = omega_start;
min_spectral_radius = inf;

for omega = omega_start:omega_step:omega_end
    G_SOR = inv(D - omega * L) * ((1 - omega) * D + omega * U);
    spectral_radius = max(abs(eig(G_SOR)));
    if (spectral_radius < min_spectral_radius && spectral_radius < 1)
        min_spectral_radius = spectral_radius;
        optimal_omega = omega;
    end
end


while k <= max_iter &&~band
    for i=1:dim(1)
        sum1=0;
        for j=1:i-1
            sum1=sum1 +(A(i,j)*y(j));
        end
        sum2=0;
        for j=i+1:dim(2)
            sum2=sum2 +(A(i,j)*x(j));
        end
        y(i)=(1-optimal_omega)*x(i)+(optimal_omega/A(i,i)*(b(i)-sum1-sum2));
    end
    if norm(y-x,inf) < tolerancia
        band=1
    else
        x=y;
    end
    k=k+1;
end
if band == 1
    fprintf('Vector solucion: \n');
    disp(y);
    fprintf('Total iteraciones realizadas: %d \n', k);
    fprintf('W optimo %d \n', optimal_omega);
else
 fprintf('No se pudo hallar la solucion');
end

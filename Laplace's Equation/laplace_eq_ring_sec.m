%Fourier method for Laplace's equation in a ring sector
function laplace_eq_ring_sec

N = 29;
for k = 0 : N
    Ak(k+1) = 36*coef_int(k)/pi/(3^(2*k+1)-3^(-2*k-1));
end

[r,phi] = meshgrid([1:0.1:3],[0:pi/100:pi/2]);

u = 0;
for k = 0 : N
    u = u+ Ak(k+1)*(r.^(2*k+1)-r.^(-2*k-1)).*cos((2*k+1)*phi);
end

x = r.*cos(phi);
y = r.*sin(phi);
surf(x,y,u)

%
function res = coef_int(k)
x = 0:pi/200:pi/2;
f = cos((2*k+1)*x).*b_data(x);
res = trapz(x,f);

% 
function res = b_data(phi)
x = 3*cos(phi);
y = 3*sin(phi);
res = y.^2.*sin(2*x);
%Fourier method for Laplace's equation in a rectangle
function laplace_eq_rct
N=24;

for k = 0 : N
    Ak(k+1) = coef_int(k)/8/(exp(3*(2*k+1)*pi/4)-exp(-3*(2*k+1)*pi/4));
end

[x,y] = meshgrid([0:0.05:2],[0:0.1:3]);

u = 0;
for k = 0 : N
    u = u + Ak(k+1)*(exp((2*k+1)*pi*y/4)-exp(-(2*k+1)*pi*y/4)).*sin((2*k+1)*pi*x/4);
end

surf(x,y,u)


% 

function res = coef_int(k)
xx = 0:0.02:2;
yy = sin((2*k+1)*pi*xx/4).*b_data(xx);
res = trapz(xx,yy);

%

function res = b_data(x)
res = (4*x-x.^2).*cos(2*pi*x);
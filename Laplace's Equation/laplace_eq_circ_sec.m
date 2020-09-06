%Fourier method for Laplace's equation in a sector
function laplace_eq_circ_sec

N=30;
for k=1:N
    Ak(k) = 2^(2-4*k)*int_coef(k)/(pi*k);
end

[r,phi]=meshgrid([0:0.1:2],[0:pi/100:pi/4]);

u=0;
for k=1:N
    u = u + Ak(k)*r.^(4*k).*sin(4*k*phi);
end

x=r.*cos(phi);
y=r.*sin(phi);
surf(x,y,u)

%
function res=int_coef(k)
s=0:pi/400:pi/4;
f=sin(4*k*s).*b_data(s);
res=trapz(s,f);

% 
function res=b_data(phi)
x=cos(phi);
y=sin(phi);
res = - y.^3 + x.^2.*y;
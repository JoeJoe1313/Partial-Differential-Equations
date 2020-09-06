%Fourier method for Laplace's equation in a ring
function laplace_eq_ring

N  = 25;
A0 = int_cos(0)/(2*pi);
for k = 1 : N
    Ak(k) = int_cos(k)/(pi*(2^k+2^(-k)));
    Bk(k) = int_sin(k)/(pi*(2^k+2^(-k)));
end

[r,phi] = meshgrid([1:0.05:2],[0:pi/40:2*pi]);

u = A0;
for k = 1 : N
    u = u + ( Ak(k)*cos(k*phi)+Bk(k)*sin(k*phi) ).*( r.^k + r.^(-k) );
end

x = r.*cos(phi);
y = r.*sin(phi);
surf(x,y,u)

%
function res = int_cos(k)
s = 0:pi/100:2*pi;
f = cos(k*s).*b_data(s);
res = trapz(s,f);

%
function res = int_sin(k)
s = 0:pi/100:2*pi;
f = sin(k*s).*b_data(s);
res = trapz(s,f);

%
function res = b_data(phi)
x = 2*cos(phi);
y = 2*sin(phi);
res = x.*cos(pi*y/2);
%Fourier method for Laplace's equation in a circle
function laplace_eq_circle

N=20;
A0=int_cos(0)/(2*pi);
for k=1:N
    Ak(k)=int_cos(k)/pi;
    Bk(k)=int_sin(k)/pi;
end

[r,phi]=meshgrid([0:0.1:2],[0:pi/50:2*pi]);

u=A0;
for k=1:N
    u=u+Ak(k)*r.^k.*cos(k*phi)+Bk(k)*r.^k.*sin(k*phi);
end

x = r.*cos(phi);
y = r.*sin(phi);
surf(x,y,u)

%
function res=int_cos(k)
s = 0:pi/100:2*pi;
f = cos(k*s).*b_data(s);
res = trapz(s,f);

%
function res=int_sin(k)
s = 0:pi/100:2*pi;
f = sin(k*s).*b_data(s);
res = trapz(s,f);

%
function res = b_data(phi)
x = 2*cos(phi);
y = 2*sin(phi);
res = cos(2*x)+cos(y);
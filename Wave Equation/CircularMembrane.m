function CircularMembrane
clc
a=0.5;
r=3;
rho=0:r/50:r;
phi=0:pi/25:2*pi;

tmax=30;
t=linspace(0,tmax);

N=40;

% namirane na purvite 40 polojitelni nuli na funkciata na Bessel

bessj0 = inline('besselj(0,x)') ;
for n = 1:N
mju(n) = fzero(bessj0, [( n-1) n ]* pi );
end

% zadavane na nachalnoto polojenie

function y=tau(rho)
            y=rho.^2.*sin(pi*rho).^3;
end

% presmiatane stoinostite na reshenieto
    
function y=solution(R,t)
y=0;
    for m=1:N
    s=tau(R(1,:)).*R(1,:).*besselj(0,mju(m)*R(1,:)/r);
    A0m=4*trapz(R(1,:),s)/((r^2)*(besselj(1,mju(m))^2)); 
    y=y+A0m*cos(a*mju(m)*t/r)*besselj(0,mju(m)*R/r);
    end
end

% suzdavane na mreja ot tocki

[R,p]=meshgrid(rho,phi);
X=R.*cos(p);Y=R.*sin(p);

% animacia na dvijenieto na membranata
 
for k=1:length(t)
    Z=solution(R,t(k));
surf(X,Y,Z)
axis([-r r -r r -30 30])
title('Circular membrane')
xlabel('x');
ylabel('y');
zlabel('u(x,y,t)');
M(k)=getframe;
end

   %movie(M,1,5)    
end

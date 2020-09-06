function Rmembrana2
clc
a=1;b=2;c=pi;
tmax=6;
t=linspace(0,tmax);
x=linspace(0,a,50);
y=linspace(0,b,50);
[X,Y]=meshgrid(x,y);

    

function z=solution(x,y,t)
z=0;
for n=1:30
    for m=1:30
        lambda=pi^2*(n^2/a^2+m^2/b^2);
        xx=linspace(0,a);
        yy=linspace(0,b);
        Anm=4*trapz(xx,cos(pi/2+pi*xx/a).*sin(n*pi*xx/a))...
            .*trapz(yy,cos(pi/2+pi*yy/b).*sin(m*pi*yy/b))/a/b ;
        z=z+Anm*cos(c*sqrt(lambda)*t)*sin(n*pi*x/a).*sin(m*pi*y/b);
    end
end
end


for k=1:length(t)
Z=solution(X,Y,t(k));
surf(X,Y,Z); 
grid on;
axis([0 a 0 b -1 1]);
xlabel('x');
ylabel('y');
zlabel('u(x,y,t)');
getframe;
end
 
end
 




  


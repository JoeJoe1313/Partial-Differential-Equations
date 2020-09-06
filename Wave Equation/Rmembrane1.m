function Rmembrane1

tmax=6;
t=0:tmax/50:tmax;
x=0:pi/50:pi;
y=0:pi/50:pi;
[X,Y]=meshgrid(x,y);

function u=solution(x,y,t)
 u=cos(sqrt(2).*t).*sin(x).*sin(y)+ ...
 sin(5*t).*sin(4.*x).*sin(3.*y)/5;
end

 for k = 1:length(t)
     
 Z=solution(X,Y,t(k));
 surf(X,Y,Z);
 grid on;
axis([0 pi 0 pi -1 1]);
xlabel('x');
ylabel('y');
 zlabel('u(x,y,t)');

getframe;
end

end

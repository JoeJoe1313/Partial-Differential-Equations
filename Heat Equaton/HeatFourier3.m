function HeatFourier3
clc
clf
L=10;
c0=0.05;c1=-0.1;c2=0.1; 
tmax=20;
t=linspace(0,tmax);
x=linspace(0,L);

% ?????????? ??????????? ?? ?????????
    function y=heat(x,t)
K=50;
 y=c1+((c2-c1)/L).*x;
for k=1:K
    Xk=sin(k*pi*x/L);
    Ak=(c0-c1+(-1)^k*(c2-c0))/k;
    Tk=Ak*exp(-(k*pi/L)^2*t);
    y=y+Xk*Tk;
end
end

% ???????? ?? ??????????? ?? ?????????????
for n=1:length(t)
    plot(x,heat(x,t(n)),'r','LineWidth',2)
    axis([0, L, -1/10, 0.2])
    grid on
            xlabel('x')
            ylabel('The temtretaure u(x,t)')
            
            title('The heat transfer in a bar with fixed tempreture at the ends')
    getframe;
  end

  % ??? ??????? ??????? ?? ??????????
subplot(3,1,1)
plot(x,heat(x,0),'r', 'LineWidth',2)
           axis([0, L, -1/10, 0.2])
    grid on
            xlabel('x')
            ylabel('u(x,0)')
            title('The heat transfer in a bar with fixed tempreture at the ends')
   
subplot(3,1,2)
plot(x,heat(x,1),'r', 'LineWidth',2)
            axis([0, L, -1/10, 0.2])
    grid on
            xlabel('x')
            ylabel('u(x,1)')
            
   
            

subplot(3,1,3)
plot(x,heat(x,20),'r', 'LineWidth',2)
            axis([0, L, -1/10, 0.2])
    grid on
            xlabel('x')
            ylabel('u(x,20)')
            
   
           
  
end

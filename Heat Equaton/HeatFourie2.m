function HeatFourier2
 
L=3;a=0.2;
tmax=8;
t=linspace(0,tmax);
x=linspace(0,L);

% ???????? ?? ????????? ???????????? ?? ?????????????
 
function y=phi(x)
        for i=1:length(x)
        if 1<x(i) && x(i)<5/2
        y(i)=-(2*x(i)^2-7*x(i)+5)^3;
        else
        y(i)=0;
        end
        end
%y=1;
end
 
% ?????????? ??????????? ?? ?????????
    function y=heat(x,t)
K=40;
 y=trapz(x,phi(x))/L;
for k=1:K
    Xk=cos(k*pi*x/L);
    Ak=2*trapz(x, phi(x).*Xk)/L;
    Tk=Ak*exp(-(a*k*pi/L)^2*t);
    y=y+Xk*Tk;
end
end
    
  for n=1:length(t)
    plot(x,heat(x,t(n)),'r','LineWidth',2)
    axis([0,L,-0.1,1.5])
    grid on
            xlabel('x')
            ylabel('The temtretaure u(x,t)')
            title('The heat transfer in a bar with isolated ends')
    getframe;
  end

  % ??? ??????? ??????? ?? ??????????
subplot(3,1,1)
plot(x,heat(x,0),'r', 'LineWidth',2)
           axis([0,L,-0.1,1.5])
    grid on
            xlabel('x')
            ylabel('u(x,0)')
            title('The heat transfer in a bar with isolated ends')
   
subplot(3,1,2)
plot(x,heat(x,4),'r', 'LineWidth',2)
            axis([0,L,-0.1,1.5])
    grid on
            xlabel('x')
            ylabel('u(x,4)')
            
   
            

subplot(3,1,3)
plot(x,heat(x,8),'r', 'LineWidth',2)
            axis([0,L,-0.1,1.5])
    grid on
            xlabel('x')
            ylabel('u(x,8)')
            
   
           
  
end

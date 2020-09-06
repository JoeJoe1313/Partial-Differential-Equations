function HeatCauchy
clc
clf

xmin=-1; xmax= 5;
tmax=3;
a=0.6;

x=linspace(xmin,xmax);
t=linspace(0,tmax);

% ???????? ?? ???????? ????????????? ?? ?????????????
    function y=phi(x)
        y=exp(-(x-2).^2);
    end

% ?????????? ?? ????????? ?? ??????
    function y=poisson(x,t)
        eta=xmin-10^2:0.1:xmax+10^2;
        for i=1:length(x)
            y(i)=trapz(eta,exp(-eta.^2).*phi(x(i)+2*a*eta*sqrt(t)))/sqrt(pi);
        end
    end
        
            
     % ????????   
    
        for k=1:length(t)
            plot(x,poisson(x,t(k)),'r', 'LineWidth',2)
            axis([xmin,xmax,0,1.1])
            grid on
            xlabel('x')
            ylabel('u(x,t)')
            title('Cauchy problem for the heat equation u_t=a^2u_{xx}')
            getframe;
            
        end
% ??? ??????? ??????? ?? ??????????
subplot(3,1,1)
plot(x,poisson(x,0),'r', 'LineWidth',2)
            axis([xmin,xmax,0,1.1])
            grid on
            xlabel('x')
            ylabel('u(x,0)')
            title('Cauchy problem for the heat equation u_t=a^2u_{xx}')

subplot(3,1,2)
plot(x,poisson(x,1),'r', 'LineWidth',2)
            axis([xmin,xmax,0,1.1])
            grid on
            xlabel('x')
            ylabel('u(x,1)')
            

subplot(3,1,3)
plot(x,poisson(x,3),'r', 'LineWidth',2)
            axis([xmin,xmax,0,1.1])
            grid on
            xlabel('x')
            ylabel('u(x,3)')
           

end
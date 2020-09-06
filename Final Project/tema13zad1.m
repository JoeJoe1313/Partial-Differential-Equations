function tema13zad1
clc 

%Задаваме областта C
xmin=-1;
xmax=1;

%Задаваме коефициента на топлопроводност
a=1/sqrt(10);

x=linspace(xmin,xmax);

    %Създаваме функцията Фи
    function y=phi(x)
        y=sin(x)-exp(-x.^2);
    end
    
    %Създаваме функиця, която пресмята стойностите на решенеито на задачата с помощта на
    %интеграла на Поасон
    function y=poisson(x,t)
        eta=xmin - 10^2:0.1:xmax+10^2;
        for i = 1:length(x)
            y(i)=trapz(eta,exp(-eta.^2).*phi(x(i)+2*a*eta*sqrt(t)))/sqrt(pi);
        end
    end

%Графика на разпределението на топлината в частта C от пръта в
%момента t=0
subplot(3,1,1)
plot(x,poisson(x,0),'r','LineWidth',2)
axis([xmin,xmax,-1.5,1])
grid on
xlabel('x')
ylabel('u(x,0)')
title('Cauchy problem for the heat equation u_t=a^2u_{xx}')

%Графика на разпределението на топлината в частта C от пръта в
%момента t=2
subplot(3,1,2)
plot(x,poisson(x,2),'r','LineWidth',2)
axis([xmin,xmax,-1.5,1])
grid on
xlabel('x')
ylabel('u(x,2)')

%Графика на разпределението на топлината в частта C от пръта в
%момента t=5
subplot(3,1,3)
plot(x,poisson(x,5),'r','LineWidth',2)
axis([xmin,xmax,-1.5,1])
grid on
xlabel('x')
ylabel('u(x,5)')

end

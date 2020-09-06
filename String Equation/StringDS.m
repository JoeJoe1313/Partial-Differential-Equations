function StringDS
clc
clear all;
L=4*pi;
a=1;
T=20;
h=L/100;
tau=T/250;
x=0:h:L; 
t=0:tau:T;
c=(tau*a)/h;

function y=phi(x)
 y=sin(pi*x/L);
end

    function y=psi(x)
        y=sin(2*pi*x/L);
    end


function y=ni(t)
 y=-sin(t)^2;
end

    function y=mu(t)
        y=sin(t)^2;
    end

    function y= f(x,t)
        y=4*cos(x.*(x-L))*sin(t)^3;
    end

for j=1:length(t)
    for i=1:length(x)
        if i>1 && i<length(x)
            if j==1
            u(i,j)=phi(x(i));
            elseif j==2
            u(i,j)=phi(x(i))+c^2/2*(phi(x(i+1))-2*phi(x(i))+phi(x(i-1)))...
                +tau^2/2*f(x(i),t(j))+tau*psi(x(i));
            else
            u(i,j)=2*(1-c^2)*u(i,j-1)+c^2*(u(i+1,j-1)+u(i-1,j-1))-u(i,j-2)+tau^2*f(x(i),t(j));
            end
        elseif i==1 
        u(i,j)=mu(t(j));
        else u(i,j)=ni(t(j));
        end
    end
end




for k = 1:length(t)
    clf;
    hold on;
    y=u(:,k);
    plot(x,y,'LineWidth',2,'Color','r');
    plot(L,y(length(y)),'ko',...
    'MarkerFaceColor',[0 0 0]);
    plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
    grid on;
    title('String Vibration')
    axis([0 L -5 5]);
    xlabel('x');
    ylabel('u(x,t)');
    getframe;
end

end
function StringFourier1
clf
L=pi*sqrt(5);
a=2/3;
x=0:L/100:L;
tmax=30;
t=linspace(0,tmax);
% задаване на началните данни
function y=phi(x)
    for i=1:length(x)
        if 1<x(i) && x(i)<3
        y(i)=sin(pi*x(i))^3;
        else
        y(i)=0;
        end
    end

end

    function y=psi(x)
    y=0*x;
    end

% предмятане на стойностите на решението
        function y=fourieru(x,t)
        y=0;
            for k=1:100
            Xk=sin(k*pi*x/L);
            Ak=(2/L)*trapz(x(1,:),phi(x(1,:)).*Xk(1,:));
            Bk=2/(a*k*pi)*trapz(x(1,:),psi(x(1,:)).*Xk(1,:));
            Tk=Ak*cos(a*k*pi*t/L)+Bk*sin(a*k*pi*t/L);
            y=y+ Tk*Xk;
            end
        end
%анимация на движението на струната
        for n=1:length(t)
        clf
        hold on
        y=fourieru(x,t(n));
        plot(x,y,'LineWidth',2,'Color','r');
        plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
        plot(L,y(length(y)),'ko','MarkerFaceColor',[0 0 0]);
        title('String Vibration')
        xlabel('x');
        ylabel('u(x,t)');
        axis([0 L -1 1]);
        grid on;
        getframe;
        end


end

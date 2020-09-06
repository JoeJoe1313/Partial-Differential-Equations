function StringFourier2
clf
L=pi*sqrt(5); a=2/3;
x=0:L/100:L;
tmax=30;
t=linspace(0,tmax);

% задване на началните данни
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

% пресмятане на стойностите на решението
function y=fourieru(x,t)
y=0; 
    for k=0:100
    Xk=cos(((2*k+1)*pi/(2*L)).*x);
    Ak=(2/L)*trapz(x(1,:),phi(x(1,:)).*Xk(1,:));
    Bk=(4/(2*k+1)*pi*a)*trapz(x(1,:),psi(x(1,:)).*Xk(1,:));...
    2/(a*k*pi)*trapz(x(1,:),psi(x(1,:)).*Xk(1,:));
    Tk=Ak*cos((2*k+1)*pi*a*t/(2*L))+Bk*sin((2*k+1)*pi*a*t/(2*L));
    y=y+ Tk*Xk;
    end
end

% анимация на двежнеието на струната
for n=1:length(t)
    clf
    hold on
    y=fourieru(x,t(n)); plot(x,y,'LineWidth',2,'Color','r');
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



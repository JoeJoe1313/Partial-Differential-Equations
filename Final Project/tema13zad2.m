function tema13zad2
clc 

%Задаваме началните данни 
L=pi;
w=1;
tmax=7;

    function y=phi(x)
        y=cos((3*x)/2);
    end

    function y=psi(x)
        y=0*x;
    end

    % Пресмятаме стойностите на решението
    function y=solution(x,t)
        y=0; 
        for k=0:50
            Xk=cos(((2*k+1)*pi/(2*L)).*x);
            Ak=(2/L)*trapz(x,phi(x).*Xk);
            Bk=(4/(2*k+1)*pi*w)*trapz(x,psi(x).*Xk);...
                2/(w*k*pi)*trapz(x,psi(x).*Xk);
            Tk=Ak*cos((2*k+1)*pi*w*t/(2*L))+Bk*sin((2*k+1)*pi*w*t/(2*L));
            y=y+ Tk*Xk;
        end
    end

x=linspace(0,L,200);
t=linspace(0,tmax,200);

%Анимация на движението на струната
for n=1:length(t)
    clf
    hold on
    y=solution(x,t(n));
    plot(x,y,'r','LineWidth',2)
    plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
    plot(L,y(length(y)),'ko','MarkerFaceColor',[0 0 0]);
    axis([0,L,-1,1])
    grid on
    xlabel('x')
    ylabel('u(x,t)')
    title('string vibration')
    getframe;
end

%Графика на анимацията в началния момент t=0
subplot(3,1,1)
hold on
y=solution(x,0);
plot(x,y,'r','LineWidth',2)
plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
plot(L,y(length(y)),'ko','MarkerFaceColor',[0 0 0]);
axis([0,L,-1,1])
grid on
xlabel('x')
ylabel('u(x,0)')

%Графика на анимацията в междинния момент t=2
subplot(3,1,2)
hold on
y=solution(x,2);
plot(x,y,'r','LineWidth',2)
plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
plot(L,y(length(y)),'ko','MarkerFaceColor',[0 0 0]);
axis([0,L,-1,1])
grid on
xlabel('x')
ylabel('u(x,2)')

%Графика на анимацията в крайния момент t=7
subplot(3,1,3)
hold on
y=solution(x,7);
plot(x,y,'r','LineWidth',2)
plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
plot(L,y(length(y)),'ko','MarkerFaceColor',[0 0 0]);
axis([0,L,-1,1])
grid on
xlabel('x')
ylabel('u(x,7)')

end
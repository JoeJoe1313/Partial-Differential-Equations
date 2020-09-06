function fixedstringprod

tmax=50; a=pi; L=3*pi;
x=0:1/100:L; t=linspace(0,tmax,50);

% задаване на началните данни
function y=phi(x)
        if pi<=x && x<=2*pi
        y=-sin(x)^3;
        elseif (0<=x && x<pi) || (2*pi<x && x<=L)
        y=0;
        end
    end

    function y=psi(x)
        y=sin(x)/10;
    end

% нечетни продължения на началните данни

    function y=phi_ood(x)
            if 0<=x && x<=L
            y=phi(x);
            elseif -L<=x && x<0
            y=-phi(-x);
            end
    end

   function y=psi_ood(x)

        for i =1:length(x)
            if 0<=x(i) && x(i)<=L
            y(i)=psi(x(i));
            elseif -L<=x(i) && x(i)<0
            y(i)=-psi(-x(i));
            end
        end
   end

% периодични продължения върху цялата реална права
        function y=phi_period(x)
                if -L<=x && x<=L
                y=phi_ood(x);
                elseif x>L
                y=phi_period(x-2*L);
                else y=phi_period(x+2*L);
                end
         end

    function y=psi_period(x)
            for j =1:length(x)
                if -L<=x(j) && x(j)<=L
                y(j)=psi_ood(x(j));
                elseif x(j)>L
                y(j)=psi_period(x(j)-2*L);
                else y(j)=psi_period(x(j)+2*L);
                end
            end
    end

% пресмятане на стойностите на решенията
function y=dalambert(x,t)
       a=1/2;
        for k=1:length(x)
          if t==0
          integral=0;
          else
          s=linspace(x(k)-a*t,x(k)+a*t);
          integral=trapz(s,psi_period(s));
          end
        y(k)=(phi_period(x(k)-a*t)+phi_period(x(k)+a*t))/2 ...
        +integral/(2*a);
        end
end

% анимация на движението на струната
        for n=1:length(t)
         clf;
        hold on;
        plot(x,dalambert(x,t(n)),'LineWidth',2,'Color','r');
        plot(0,0,'ko','MarkerFaceColor',[0 0 0]);
        plot(L,0,'ko','MarkerFaceColor',[0 0 0]);
        axis([0 L  -1 1]);
        title('Vibration of a finite String')
        grid on;
        xlabel('x');
        ylabel('u(x,t)');
        M(n)=getframe;
        end
        
        movie(M,1)
% изчертаване на положението на струната в три фиксирани момента

        subplot(3,1,1)
plot(x,dalambert(x,t(1)),'r','Linewidth',2)
hold on
plot(0,0,'ko','MarkerFaceColor',[0 0 0]);
plot(L,0,'ko','MarkerFaceColor',[0 0 0]);
axis([0 L  -1 1]);
title('Vibration of a finite String')
xlabel('x') 
ylabel('u(x,0)')

subplot(3,1,2) 
plot(x,dalambert(x,10),'r','Linewidth',2)
hold on
plot(0,0,'ko','MarkerFaceColor',[0 0 0]);
plot(L,0,'ko','MarkerFaceColor',[0 0 0]);
axis([0 L  -1 1]);
xlabel('x') 
ylabel('u(x,10)')

subplot(3,1,3) 
plot(x,dalambert(x,20),'r','Linewidth',2)
hold on
plot(0,0,'ko','MarkerFaceColor',[0 0 0]);
plot(L,0,'ko','MarkerFaceColor',[0 0 0]);
axis([0 L  -1 1]);
xlabel('x') 
ylabel('u(x,20)')
end

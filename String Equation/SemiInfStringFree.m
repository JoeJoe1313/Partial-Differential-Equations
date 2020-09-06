function SemiInfStringFixed

clf
tmax=6;
t=linspace(0,tmax);
xmin=0;xmax=4;
x=linspace(xmin,xmax);

% задаване на началните данни
  function y=phi(x)
    for i=1:length(x)
        if x(i)>=1 && x(i)<=2
                   y(i)=10*exp(4/((2*x(i)-3)^2-1));
        else
           y(i)=0;
        end
    end
  end

       function y=psi(x)
       y=0*x;
       end
   
   %четни продължения на началните данни

   function y=phi_even(x)
       if x>0
          y=phi(x);
       else
          y=phi(-x);
       end
   end
            function y=psi_even(x)
                for n=1:length(x)
                    if x(n)>0
                    y(n)=psi(x(n));
                    else
                    y(n)=psi(-x(n));
                    end
                end
            end

% пресмятане на стойностите на решението чрез формулата на Даламбер
   function y=dalambert(x,t)
       a=1/2;
        for j=1:length(x)
          if t==0
          integral=0;
          else
          s=linspace(x(j)-a*t,x(j)+a*t);
          integral=trapz(s,psi_even(s));
          end
        y(j)=(phi_even(x(j)-a*t)+phi_even(x(j)+a*t))/2+integral/(2*a);
        end
   end
% анимация на движенитео на частта от струната
    for k=1:length(t)
    plot(x,dalambert(x,t(k)),'r','Linewidth',2)
    axis ([xmin,xmax,-0.2,0.2])
    title('Vibration of a Semi-infinite String')
    grid on
    xlabel('x')
    ylabel('u(x,t)')
    M=getframe;
    end

    % изчертаване на положението на частта от струната в три фиксирани
    % момента
subplot(3,1,1) 
plot(x,dalambert(x,t(1)),'r','LineWidth',2)
title('Vibration of a Semi-infinite String')
xlabel('x')
ylabel('u(x,0)')

subplot(3,1,2) 
plot(x,dalambert(x,2),'r','LineWidth',2)
xlabel('x')
ylabel('u(x,2)')

subplot(3,1,3) 
plot(x,dalambert(x,5),'r','LineWidth',2)
xlabel('x')
ylabel('u(x,5)')

end


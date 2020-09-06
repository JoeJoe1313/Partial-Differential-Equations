function infstring
clf
tmax=6;
t=linspace(0,tmax);
xmin=-1;xmax=4;
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
% пресм€тане на решението по формулата на ƒаламбер
   function y=dalambert(x,t)
       a=1/2;
        for j=1:length(x)
          if t==0
          integral=0;
          else
          s=linspace(x(j)-a*t,x(j)+a*t);
          integral=trapz(s,psi(s));
          end
        y(j)=(phi(x(j)-a*t)+phi(x(j)+a*t))/2+integral/(2*a);
        end
   end
% анимаци€ на движенитео на частта от струната
    for k=1:length(t)
    plot(x,dalambert(x,t(k)),'r','Linewidth',2)
    axis ([xmin,xmax,-0.2,0.2])
    title('Vibration of an Infinite String')
    grid on
    xlabel('x')
    ylabel('u(x,t)')
    M=getframe;
    end

    % изчертаване на положението на частта от струната в три фиксирани
    % моменти
    subplot(3,1,1)
    plot(x,dalambert(x,t(1)),'r','Linewidth',2)
    title('Vibration of an Infinite String')
    xlabel('x')
    ylabel('u(x,0)')

    subplot(3,1,2)
    plot(x,dalambert(x,3),'r','Linewidth',2)
    xlabel('x')
    ylabel('u(x,3)')

 subplot(3,1,3)
 plot(x,dalambert(x,5),'r','Linewidth',2)
    xlabel('x')
    ylabel('u(x,5)')

end

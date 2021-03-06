function HeatDS
clear all;
L=1; 
T=2; 
h=L/10; tau=T/500;
x=0:h:L; 
t=0:tau:T;
c=tau/h^2;
% ???????? ?? ????????? ????????????? ?? ?????????????
function y=phi(x)
 y=sin(pi*x);
end

% ???????? ?? ????????????? ? ????? ????
function y=mu(t)
 y=sin(pi*t);
end

% ???????? ?? ????????????? ? ????? ????
function y=nu(t)
 y=0*t;
end

% ???????? ?? ????????? ?????
function y=f(x,t)
 y=(1-x)*(pi+t);
end

% ?????????? ??????????? ?? ?????????
for j=1:length(t)
for i=1:length(x)
if i>1 & i<length(x)
if j==1 u(i,j)=phi(x(i));
else
u(i,j+1)=(1-2*c)*u(i,j)+c*(u(i+1,j)+u(i-1,j))+tau*f(x(i),t(j));
end
else
u(1,j)=-mu(t(j));u(length(x),j)=nu(t(j));
end
end
end

 % ????????

for k = 1:length(t)
    
plot(x,u(:,k),'r','LineWidth',2); 
axis([0 L -1 1.5]);
grid on
title('Difference sheme for the heat equation')
xlabel('x')
ylabel('u(x,t)')
getframe;
end

% ??? ??????? ??????? ?? ??????????
subplot(3,1,1)
plot(x,u(:,1),'r', 'LineWidth',2)
           axis([0 L -1 1.5]);
grid on
title('Difference sheme for the heat equation')
xlabel('x')
ylabel('u(x,0)')
   
subplot(3,1,2)
plot(x,u(:,99),'r', 'LineWidth',2)
            axis([0 L -1 1.5]);
grid on
xlabel('x')
ylabel('u(x,0.4)')
            
   
            

subplot(3,1,3)
plot(x,u(:,449),'r', 'LineWidth',2)
            axis([0 L -1 1.5]);
grid on

xlabel('x')
ylabel('u(x,1.8)')
            
   
           
  


end
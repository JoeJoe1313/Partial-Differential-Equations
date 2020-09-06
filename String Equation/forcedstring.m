function forced_string
clc
clear all;
a=1/2; L=pi; T=40;
h=L/100; tau=T/1000;
x=0:h:L; 
t=0:tau:T;
c=(tau*a)/h;

function y=f(x,t)
w=1/2;
 y=-x^2*(x-L)^2*cos(w*t)/5;
end

for j=1:length(t)
for i=1:length(x)
if i>1 & i<length(x)

if j==1 |j==2 u_{i,j}= 0;
else
u(i,j)=2*(1-c^2)*u(i,j-1)+c^2*(u(i+1,j-1)...
+u(i-1,j-1))-u(i,j-2)+tau^2*f(x(i),t(j-1));
end
else u(i,j)=0;
end
end
end


for k = 1:length(t)
     clf;
    hold on;
    y=u(:,k);
      plot(x,y,'LineWidth',2,'Color','r');
    plot(0,0,'ko','MarkerFaceColor',[0 0 0]);
     plot(L,0,'ko','MarkerFaceColor',[0 0 0]);
     grid on;
   axis([0 L -40 40]);
   title('forced string');
xlabel('x');
ylabel('u(x,t)');
 getframe;
end

end
clc
clear all
close all

%% Initialization
Fun = @(x) exp(-x).*sin(3*x);
dFun = @(x) -exp(-x).*sin(3*x)+ 3*exp(-x).*cos(3*x);
x=linspace(0,4,101);
F=Fun(x);
h=x(2)-x(1);

%% Differentiation by central, forward and backward approximation
xCentral=x(2:end-1);
OCenteral=dFun(xCentral)-(F(3:end)-F(1:end-2))/(2*h); %error O(h^2)
xForward=x(1:end-1);
OForward=dFun(xForward)-(F(2:end)-F(1:end-1))/h; %error O(h)
xBackward=x(2:end);
OBackward=dFun(xBackward)-(F(2:end)-F(1:end-1))/h; %error O(h)
%plot(x,dFun(x));
hold on
plot(xCentral,OCenteral,'r')
plot(xForward,OForward,'k');
plot(xBackward,OBackward,'g');
legend('Central','Forward','Backward')
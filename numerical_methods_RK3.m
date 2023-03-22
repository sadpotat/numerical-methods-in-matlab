clc
clear all

%% Initialization
f= @(x,y) - 2*x^3 + 12*x^2 - 20*x + 17/2;
x0=0; %initial known value
y0=1; %initial y1
x1=4; %final known value
h=0.5; %step size
n=(x1-x0)/h; 

%% RK3
for i=1:n
    fprintf('Step %g\n',i);
    k1=f(x0,y0);
    fprintf('k1 = f(x0,y0) = f(%10.6f,%10.6f) = %10.6f\n',x0,y0,k1);
      
    k2=f(x0+h/2,y0+k1*h/2);
    fprintf('k2 = f(x0+h/2,y0+k1*h/2) = f(%10.6f,%10.6f) = %10.6f\n',x0+h/2,y0+k1*h/2,k2);
    
    k3=f(x0+h,y0-k1*h+2*k2*h);
    fprintf('k3 = f(x0+h,y0-k1*h+2*k2*h) = f(%10.6f,%10.6f) = %10.6f\n',x0+h,y0-k1*h+2*k2*h,k3);
    
    y=y0+(k1+4*k2+k3)*h/6;
    y0=y;
    x0=x0+h;
    fprintf('x=%g    y1=%10.6f\n',x0,y);
end

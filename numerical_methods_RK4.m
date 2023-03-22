clc
clear all

%% Initialization
format long
f= @(x,y) (1/(150*10^(-6)))*(-0.1 + max([(abs(18*cos(120*pi))-2-y)/0.04 0]));
x0=0; %initial known value
y0=0; %initial y1
x1=0.00006; %final time
h=0.00002; %step size
n=(x1-x0)/h; 

%% RK4
for i=1:n
    fprintf('Step %g\n',i);
    k1=f(x0,y0);
    fprintf('k1 = f(x0,y0) = f(%10.6f,%10.6f) = %10.6f\n',x0,y0,k1);
      
    k2=f(x0+h/2,y0+k1*h/2);
    fprintf('k2 = f(x0+h/2,y0+k1*h/2) = f(%10.6f,%10.6f) = %10.6f\n',x0+h/2,y0+k1*h/2,k2);
    
    k3=f(x0+h/2,y0+k2*h/2);
    fprintf('k3 = f(x0+h/2,y10+k2*h/2) = f(%10.6f,%10.6f) = %10.6f\n',x0+h/2,y0+k2*h/2,k3);
    
    k4=f(x0+h,y0+k3*h);
    fprintf('k4 = f(x0+h,y10+k3*h) = f(%10.6f,%10.6f) = %10.6f\n',x0+h,y0+k3*h,k4);
    
    y=y0+(k1+2*k2+2*k3+k4)*h/6;
    y0=y;
    x0=x0+h;
    fprintf('x=%g    y1=%g\n',x0,y);
end

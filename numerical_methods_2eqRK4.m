clc
clear all

%% Initialization
fy1= @(x,y1,y2) -0.5*y1;    % the first function
fy2= @(x,y1,y2) 4-0.3*y2-0.1*y1;    % the second function
x0=0; %initial known value
y10=4; %initial y1
y20=6; %initial y2
x1=1; %final known value
h=0.5; %step size
n=(x1-x0)/h; 

%% RK4
for i=1:n
    fprintf('Step %g\n',i);
    k1y1=fy1(x0,y10,y20);
    k1y2=fy2(x0,y10,y20);
    fprintf('k1,1 = f1(x0,y10,y20) = f1(%g,%10.6f,%10.6f) = %10.6f\n',x0,y10,y20,k1y1);
    fprintf('k1,2 = f2(x0,y10,y20) = f2(%10.6f,%10.6f,%10.6f) = %10.6f\n',x0,y10,y20,k1y2);
      
    k2y1=fy1(x0+h/2,y10+k1y1*h/2,y20+k1y2*h/2);
    k2y2=fy2(x0+h/2,y10+k1y1*h/2,y20+k1y2*h/2);
    fprintf('k2,1 = f1(x0+h/2,y10+k1y1*h/2,y20+k1y2*h/2) = f1(%g,%10.6f,%10.6f) = %10.6f\n',x0+h/2,y10+k1y1*h/2,y20+k1y2*h/2,k2y1);
    fprintf('k2,2 = f2(x0+h/2,y10+k1y1*h/2,y20+k1y2*h/2) = f2(%g,%10.6f,%10.6f) = %10.6f\n',x0+h/2,y10+k1y1*h/2,y20+k1y2*h/2,k2y2);
    
    k3y1=fy1(x0+h/2,y10+k2y1*h/2,y20+k2y2*h/2);
    k3y2=fy2(x0+h/2,y10+k2y1*h/2,y20+k2y2*h/2);
    fprintf('k3,1 = f1(x0+h/2,y10+k2y1*h/2,y20+k2y2*h/2) = f1(%g,%10.6f,%10.6f) = %10.6f\n',x0+h/2,y10+k2y1*h/2,y20+k2y2*h/2,k3y1);
    fprintf('k3,2 = f2(x0+h/2,y10+k2y1*h/2,y20+k2y2*h/2) = f2(%g,%10.6f,%10.6f) = %10.6f\n',x0+h/2,y10+k2y1*h/2,y20+k2y2*h/2,k3y2);
    
    k4y1=fy1(x0+h,y10+k3y1*h,y20+k3y2*h);
    k4y2=fy2(x0+h,y10+k3y1*h,y20+k3y2*h);
    fprintf('k4,1 = f1(x0+h,y10+k3y1*h,y20+k3y2*h) = f1(%g,%10.6f,%10.6f) = %10.6f\n',x0+h,y10+k3y1*h,y20+k3y2*h,k4y1);
    fprintf('k4,2 = f2(x0+h,y10+k3y1*h,y20+k3y2*h) = f2(%g,%10.6f,%10.6f) = %10.6f\n',x0+h,y10+k3y1*h,y20+k3y2*h,k4y2);
    
    y1=y10+(k1y1+2*k2y1+2*k3y1+k4y1)*h/6;
    y2=y20+(k1y2+2*k2y2+2*k3y2+k4y2)*h/6;
    y10=y1;
    y20=y2;
    x0=x0+h;
    fprintf('x=%g    y1=%10.6f    y2=%10.6f\n',x0,y1,y2);
end

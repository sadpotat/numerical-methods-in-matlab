clc
clear all

%% Initialization
format long
f= @(x,y) 1000-3*y;    % function to be solved
x0=0; %initial known value
y0=0; %initial y1
x1=1.2; %final known value
h=0.4; %step size
n=(x1-x0)/h;

%% Method selection
c=input('Case 1.Huen  2.Midpoint  3.Rolston: ');
switch c
    case 1
        % Huen
        a2=0.5;
        a1=0.5;
        p1=1; q11=1;
    case 2
        % Midpoint
        a2=1;
        a1=0;
        p1=0.5; q11=0.5;
    case 3
        % Rolston
        a2=2/3;
        a1=1/3;
        p1=3/4; q11=3/4;
end

%% RK2
i=1;
while x0<x1
    fprintf('Step %g\n',i);
    k1=f(x0,y0);
    fprintf('k1 = f(x0,y0) = f(%g,%10.6f) = %10.6f\n',x0,y0,k1);
      
    k2=f(x0+p1*h,y0+q11*k1*h);
    fprintf('k2 = f(x0+p1*h,y0+q11*k1*h) = f(%g,%10.6f) = %10.6f\n',x0+p1*h,y0+q11*k1*h,k2);
    
    y=y0+(a1*k1+a2*k2)*h;
    y0=y;
    x0=x0+h;
    fprintf('x=%g    y1=%10.6f\n',x0,y);
    i=i+1;
end

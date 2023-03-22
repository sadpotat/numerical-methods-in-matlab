clc
clear all

%% Initialization
f1= @(x,y1,y2) -0.5*y1; 
f2= @(x,y1,y2) 4-0.3*y2-0.1*y1;
x0=0; %initial known value
y10=4; %initial y1
y20=6; %initial y2
x1=2; %final known value
h=0.5; %step size
n=(x1-x0)/h; 

%% Euler's Method
for i=1:n 
    fprintf('Step %g\nx%g=%10.6f\ny1%g=%10.6f\tf(x,y1,y2)=%10.6f\ny2%g=%10.6f\tf(x,y1,y2)=%10.6f\n',i,i-1,x0,i-1,y10,f1(x0,y10,y20),i-1,y20,f2(x0,y10,y20));
    y1(i)=y10+f1(x0,y10,y20)*h;
    y2(i)=y20+f2(x0,y10,y20)*h;
    x0=x0+h;
    y10=y1(i);
    y20=y2(i);
    fprintf('x%g=%g\ty1%g=%10.6f\ty2%g=%10.6f\n\n',i,x0,i,y10,i,y20);
    
end
clc
clear all

%% Initialization
f= @(t,v) (9.81-(0.25/68.1)*v^2);
x0=0; %initial known value
y0=1; %initial y1
x1=4; %final time
h=0.5; %step size
n=(x1-x0)/h; 
for i=1:n 
    fprintf('Step %g,\t\tx%g=%g\t\ty%g=%10.6f\t\tf(x,y)=%10.6f\n',i,i-1,x0,i-1,y0,f(x0,y0));
    y(i)=y0+f(x0,y0)*h;
    x0=x0+h;
    y0=y(i);
    fprintf('\t\t\tx%g=%g\t\ty%g=%10.6f\n\n',i,x0,i,y0);
    
end
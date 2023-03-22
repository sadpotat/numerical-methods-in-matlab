clc
clear all

%% Initialization
format long
syms x
f(x)=1/sqrt(2*pi)*exp(-x^2/2);
a=0.2; %initial
b=0.8; %final
n=input('segment, n = '); %no. of seg
h=(b-a)/n; %step size
fprintf('h=%g\n',h);

%% Trapezoidal
x=a:h:b;
fprintf('f(a)=%10.6f\n',f(a));
I=f(a)+f(b);
for i=2:n
    fprintf('x%g=%g\t\t',i-1,x(i));
    fprintf('f(x%g)=%10.6f\n',i-1,f(x(i)));
    I=I+2*f(x(i));
end
fprintf('f(b)=%10.6f\n',f(b));
I=I*h/2;
fprintf('I=%10.6f\n',I);

    
    
    
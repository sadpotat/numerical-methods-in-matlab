clc
clear all

%% Initialization
format long
syms x
f(x)=1/sqrt(2*pi)*exp(-x^2/2);
a=-2.15; %initial
b=2.9; %final
t=1.640533;
n=input('segment, n = '); %no. of seg, min 2
h=(b-a)/n; %step size
fprintf('h=%g\n',h);

%% Simpson's 1/3
x=a:h:b;
fprintf('f(a)=%10.6f\n',f(a));
I=f(a)+f(b);
for i=2:n
    fprintf('x%g=%g\t\t',i-1,x(i));
    fprintf('f(x%g)=%10.6f\n',i-1,f(x(i)));
    if mod(i-1,2)~=0
        I=I+4*f(x(i));
    else
        I=I+2*f(x(i));
    end
    
end
fprintf('f(b)=%10.6f\n',f(b));
I=I*h/3;
fprintf('I=%10.6f\n',I);
if ~isempty(t)
    et=abs(((t-I)/t)*100);
    fprintf('et=%g\n',et);
end
    
    
    
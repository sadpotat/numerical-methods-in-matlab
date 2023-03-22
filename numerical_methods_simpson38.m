clc
clear all

%% Initialization
format long
syms x
X=[400 -900 675 -200 105 105]; %input('Enter coeff: ');
A=0;
t=1.640533; %true value
s=size(X,2);
for i=1:s
    A=A+X(i)*x^(s-i);
end
f(x)= A;
a=0.2; %initial
b=0.8; %final
n=3; %input('segment, n = '); %no. of seg, min 3
h=(b-a)/n; %step size
fprintf('h=%g\n',h);

%% Simpson's 3/8
x=a:h:b;
fprintf('f(a)=%10.6f\n',f(a));
I=f(a)+f(b);
for i=2:n
    fprintf('x%g=%g\t\t',i-1,x(i));
    fprintf('f(x%g)=%10.6f\n',i-1,f(x(i)));
    I=I+3*f(x(i));    
end
fprintf('f(b)=%10.6f\n',f(b));
I=I*h*3/8;
fprintf('I=%10.6f\n',I);
if ~isempty(t)
    et=abs(((t-I)/t)*100);
    fprintf('et=%10.6f\n',et);
end
    
    
    
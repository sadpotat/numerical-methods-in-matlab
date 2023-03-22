clc
clear all

format long
a=0;
b=0.8;
n1=input('n1=');
n2=input('n2=');
h1=(b-a)/n1;
h2=(b-a)/n2;
I1=trape2(n1);   
I2=trape2(n2);   

I=I2 + 1/((h1/h2)^2 - 1)*(I2-I1)

function I = trape2(n)
syms x
X=[400 -900 675 -200 105 105]; %input('Enter coeff: ');
A=0;
s=size(X,2);
for i=1:s
    A=A+X(i)*x^(s-i);
end
f(x)= A;
fprintf('for %g segments*****************************\n',n);
a=0; %initial
b=0.8; %final
h=(b-a)/n; %step size
fprintf('h=%g\n',h);
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
end

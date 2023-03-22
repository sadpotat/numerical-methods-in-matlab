clc
clear all

%% Initialization
format long
disp('for n=1**************');
I1=trape(1);   %1seg
disp('for n=2**************');
I2=trape(2);   %2seg
disp('for n=4**************');
I4=trape(4);  %4seg
disp('for n=8**************');
I8=trape(8);   %8seg

%% from 1 and 2
disp('O(h4)**************');
I12=4/3*I2 - 1/3*I1;
fprintf('I12=%10.6f\n',I12);
%% from 2 and 4
disp('O(h6**************)');
I24=4/3*I4 - 1/3*I2;
I124=16/15*I24 - 1/15*I12;
fprintf('I12=%10.6f\n',I12);
fprintf('I24=%10.6f\n',I24);
fprintf('I124=%10.6f\n',I124);
%% from 4 and 8
disp('O(h8**************)');
I48=4/3*I8 - 1/3*I4;
I248=16/15*I48 - 1/15*I24;
I1248=64/63*I248 - 1/63*I124;
fprintf('I12=%10.6f\n',I12);
fprintf('I24=%10.6f\n',I24);
fprintf('I48=%10.6f\n',I48);
fprintf('I124=%10.6f\n',I124);
fprintf('I248=%10.6f\n',I248);
fprintf('I1248=%10.6f\n',I1248);

function I = trape(n)
syms x
X=[400 -900 675 -200 25 0.2]; %input('Enter coeff: ');
A=0;
s=size(X,2);
for i=1:s
    A=A+X(i)*x^(s-i);
end
f(x)= A;
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

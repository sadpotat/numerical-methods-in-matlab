clc
clear all

%% Initialization
format long
x=[911.3 636.0 451.1];
y=[25.113 30.131 40.120];
xi=input('xi= ');
f=@(i,j) (y(i)-y(j))/(x(i)-x(j));

%% NDDquad
b0=y(1);
fprintf('b0=%10.6f\n',b0);
b1=f(2,1);
fprintf('b1=%10.6f\n',b1);
b2=(f(3,2)-b1)/(x(3)-x(1));
fprintf('f(3,2)=%10.6f   b2=%10.6f\n',f(3,2),b2);
yi=b0+b1*(xi-x(1))+b2*(xi-x(1))*(xi-x(2));
fprintf('yi=%10.6f\n',yi);
clc
clear all

%% Initialization
format long ;
x=[911.3 636.0 451.1];
y=[25.113 30.131 40.120];
xi=input('xi= ');

%% NDDlinear
b0=y(1);
fprintf('b0=%10.6f\n',b0);
b1=(y(2)-y(1))/(x(2)-x(1));
fprintf('b1=%10.6f\n',b1);
yi=b0+b1*(xi-x(1));
fprintf('yi=%10.6f\n',yi);
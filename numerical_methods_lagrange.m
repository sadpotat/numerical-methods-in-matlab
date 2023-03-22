clc
clear all
format long

%% Initialization
x=[1101 911.3 636 451.1];
y=[105 120.131 130.12 155.128];
xi=754.8;
A=0;
L=1;

%% Lagrange
for i=1:size(x,2)
    for j=1:size(x,2)
        if j==i
            continue
        end
        L=L*((xi-x(j))/(x(i)-x(j)));
    end
    fprintf('L=%10.6f  f(x)=%10.6f\t',L,y(i));
    A=A+L*y(i);
    fprintf('A=%10.6f\n',A);
    L=1;
end

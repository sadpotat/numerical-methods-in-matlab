% Enter X and Y as row vectors
% sample input X = [0.6 0.7 0.8 0.9 1 1.1], Y = [0.01 0.05 0.2 0.7 2 4]

clc
clear all

%% Initialization
n=input('Number of sets of points : ');
%taking input
x=input('X:');
y=input('Y:');

%% Calculating Coefficients
sumx=0;
sumy=0;
sumxy=0;
sumx2y=0;
sumx2=0;
sumx3=0;
sumx4=0;
for i=1:n
sumx=sumx+x(i);
sumy=sumy+y(i);
sumxy=sumxy+x(i)*y(i);
sumx2y=sumx2y+x(i)^2*y(i);
sumx2=sumx2+x(i)^2;
sumx3=sumx3+x(i)^3;
sumx4=sumx4+x(i)^4;
end
format long ; 

%% Calculating a0, a1 and a2
A=[n sumx sumx2;sumx sumx2 sumx3;sumx2 sumx3 sumx4];
r=[sumy;sumxy;sumx2y];
a=A\r; %solving by matrix inversion
a0=a(1); a1=a(2); a2=a(3);
fprintf('a0=%g\t\ta1=%g\t\ta2=%g\n',a0,a1,a2);

%% Plotting Observed Data
plot(x,y,'o')
hold on;

%% Plotting Fitted Data
ym=a0+a1.*x+a2*x.^2; 
plot(x,ym);
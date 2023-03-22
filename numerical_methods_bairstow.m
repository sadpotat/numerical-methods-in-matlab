% The following code was implemented from the algorithm given in the book
% Numerical Methods for Engineers by Steven Chapra
% Type Coeff as "[ 1 2 3 ...]" i.e Row vector form."
% Enter the values according to above order.
% sample input [1 -3.5 2.75 2.125 -3.875 1.25]

clc
clear all

%% Function initialization
format short
syms x % variable x declared symbol
A_x = 0;
disp('Polynomial function of Order "n" is of type:a[1]X^n+a[2]X^(n-1)+..+a[n]X^1+a[n+1]');
disp('Type Coeff as "[ 1 2 3 ...]" i.e Row vector form');
a = input('Enter the coefficient in order? '); %Coefficient matrix
n = size(a,2); %stores the no. of terms in the equation(=no. of columns in a)
for i = 1:n
    A_x = A_x + a(i)*(x^(n-i)); % Polynomial function building
end
disp('Polynomial is : ');
disp(A_x)

%% Initialization of other parameters
err = input('Max absolute relative error(in %): ');
rr = input('Enter the initial guess for r: '); %initial guess for sum of roots
ss = input('Enter the initial guess for s: '); %initial guess for product of roots
maxiter = input('Enter the maximum number of iterations: ');
r=rr; s=ss;
nn=0; %root count
ea1=1; ea2=1; %Initializing relative errors of r and s
iter=0; %iteration count

%% Bairstow's Method
while n>3 %main loop
    iter=0;
    while(1) %runs till r and s converge
        iter=iter+1;
        %% Calculating [b]
        b1(1)=0; b2(1)=0; b2(2)=0; b1(2)=a(1)*r; %initialization to avoid compiler errors
        b(1)=a(1); b(2)=a(2)+b1(2); %initialization to avoid compiler errors
        for i=3:n %calculates the bn terms
            b1(i)=b(i-1)*r;
            b2(i)=b(i-2)*s;
            b(i)=a(i) + b1(i) + b2(i);
        end
        %% Calculating [c]
        c1(1)=0; c2(1)=0; c2(2)=0; c1(2)=b(1)*r; %initialization to avoid compiler errors
        c(1)=a(1); c(2)=b(2)+c1(2); %initialization to avoid compiler errors
        for i=3:n %calculates the cn terms
            c1(i)=c(i-1)*r;
            c2(i)=c(i-2)*s;
            c(i)=b(i) + c1(i) + c2(i);
        end
        %% Calculating new r,s
        det=c(n-2)*c(n-2)-c(n-3)*c(n-1); %determinant of the equations to be solved to find r, s
        
        if det~=0
            %c(n-2)*dr + c(n-3)*ds = b(n-1)
            %c(n-1)*dr + c(n-2)*ds = b(n)
            dr=(-b(n-1)*c(n-2)+ b(n)*c(n-3))/det;
            ds=(-b(n)*c(n-2)+ b(n-1)*c(n-1))/det;
            r=r+dr; s=s+ds; %updates the values of r,s
            if r~=0
                ea1=abs(dr/r)*100; %updates the relative error of r
            end
            if s~=0
                ea2=abs(ds/s)*100; %updates the relative error of s
            end
        else
            %if det=0, r and s cannot be determined. Then their value is
            %incremented by 1 and the process restarts by setting iter to 0.
            r=r+1;
            s=s+1;
            iter=0;
        end
        %% Loop breaking conditions
        if ea1<err && ea2<err || iter>maxiter
            break;
        end
    end
    
    %% Calculating roots - 1
    [r,s,r1,i1,r2,i2]=Quadroot(r,s); %user defined function that returns two roots
    nn=nn+1; %moves to the next index of root
    re(nn)=r1; %real part of root
    im(nn)=i1; %imaginary part of root
    nn=nn+1;
    re(nn)=r2;
    im(nn)=i2;
    
    %% Determining coefficients of quotient
    n=n-2;
    a=deconv(a,[1 -r -s]);
    
end

%% Calculating roots - 2
if n==3
    r=-a(2)/a(1); %eq - sum of roots of a polynomial with 3 terms
    s=-a(3)/a(1); %eq - product roots of a polynomial with 3 terms
    [r,s,r1,i1,r2,i2]=Quadroot(r,s);
    nn=nn+1;
    re(nn)=r1;
    im(nn)=i1;
    nn=nn+1;
    re(nn)=r2;
    im(nn)=i2;
else %for n=2
    nn=nn+1;
    re(nn)=-a(2)/a(1); %solution of a1x-a0=0
    im(nn)=0;
end
for i=1:nn
    root(i)=re(i)+1j*(im(i)); %adds the real and imaginary parts of corresponding roots
end

%% Displaying results
fprintf('The polynomial has %d roots and they are :\n',length(root));disp(root);

%% User-defined function to find roots
function [r,s,r1,i1,r2,i2] = Quadroot(r,s)

disc = r*r + 4*s; %discriminant of the polynomial x^2-rx-s

if disc>0 %real roots
    r1=(r+sqrt(disc))/2;
    r2=(r-sqrt(disc))/2;
    i1=0; i2=0;
elseif disc==0 %squared roots
    r1=r/2; 
    r2=-r1;
    i1=0;
    i2=0;
else %complex root
    r1=r/2;
    r2=r1;
    i1=sqrt(abs(disc))/2;
    i2=-i1;
end

end
